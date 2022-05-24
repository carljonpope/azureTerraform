
data "azurerm_client_config" "current" {}

data "azuread_service_principal" "current" {
  object_id = data.azurerm_client_config.current.object_id
}

data "azurerm_key_vault" "global-keyvault" {
  name                = "${local.settings.global_environment_tag}-global-kv01"
  resource_group_name = local.settings.global_resource_group
}

data "azurerm_network_security_group" "nsg" {
  name                = local.settings.global_nsg
  resource_group_name = local.settings.global_resource_group
}

data "azurerm_subnet" "resource_subnet" {
  name                 = local.settings.subnet.name
  virtual_network_name = local.settings.vnet_name
  resource_group_name  = local.settings.global_resource_group
}

data "azurerm_app_service_plan" "app_plan" {
  name                = local.settings.app_plan.name
  resource_group_name = local.settings.app_plan.sku.resource_group
}

# Core resources
# Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = local.settings.resource_group
  location = local.settings.region
}

# Key Vault
resource "azurerm_key_vault" "kv01" {
  count                    = local.settings.create_keyvault ? 1 : 0
  name                     = local.settings.keyvault_config.name
  location                 = local.settings.region
  resource_group_name      = azurerm_resource_group.rg.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = local.settings.keyvault_config.sku_name
  soft_delete_enabled      = true
  purge_protection_enabled = true

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [data.azurerm_subnet.resource_subnet.id]
  }
}

# App Service(s)
resource "azurerm_app_service" "appservice" {
  name                = local.settings.app_name
  location            = local.settings.region
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = data.azurerm_app_service_plan.app_plan.id
  https_only          = true

  site_config {
    scm_type        = "LocalGit"
    ftps_state      = "Disabled"
    always_on       = true
    http2_enabled   = true
    min_tls_version = 1.2
  }

  identity {
    type = "SystemAssigned"
  }

  logs {
    http_logs {
      file_system {
        retention_in_mb   = 35 # in Megabytes
        retention_in_days = 35 # in days
      }
    }
  }

  app_settings = var.app_settings

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      app_settings,
    ]
  }

}

# Subnet association with App Service
resource "azurerm_app_service_virtual_network_swift_connection" "subnets" {
  subnet_id      = data.azurerm_subnet.resource_subnet.id
  app_service_id = azurerm_app_service.appservice.id
}

# Key Vault Access Policy for App Service
resource "azurerm_key_vault_access_policy" "keyvaults" {
  count        = local.settings.create_keyvault ? 1 : 0
  key_vault_id = azurerm_key_vault.kv01[0].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.appservice.identity[0].principal_id

  secret_permissions = [
    "get"
  ]
}

# Key Vault Access Policy for Global KeyVault
resource "azurerm_key_vault_access_policy" "global-keyvault-access" {
  key_vault_id = data.azurerm_key_vault.global-keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.appservice.identity[0].principal_id

  secret_permissions = [
    "get"
  ]
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  count                    = local.settings.create_storage_account ? 1 : 0
  name                     = local.settings.storage_account.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = local.settings.storage_account.account_tier
  account_kind             = local.settings.storage_account.account_kind
  account_replication_type = local.settings.storage_account.replication_type
  access_tier              = local.settings.storage_account.access_tier

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [data.azurerm_subnet.resource_subnet.id]
  }
}