resource "azurerm_mssql_server" "mssql_server" {
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  version                              = var.sql_version
  administrator_login                  = var.administrator_login
  administrator_login_password         = var.administrator_login_password
  connection_policy                    = var.connection_policy
  minimum_tls_version                  = var.minimum_tls_version
  public_network_access_enabled        = var.public_network_access_enabled
  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = var.primary_user_assigned_identity_id
  tags                                 = var.tags

  azuread_administrator {
    login_username              = var.login_username
    object_id                   = var.object_id
    tenant_id                   = var.tenant_id
    azuread_authentication_only = var.azuread_authentication_only
  }

  identity {
    type         = var.type
    identity_ids = var.identity_ids
  }
}
/*
resource "azurerm_mssql_server_extended_auditing_policy" "mssql_server_extended_auditing_policy" {
  count                                   = var.extended_auditing_enabled == "true" ? 1 : 0
  enabled                                 = var.extended_auditing_enabled
  server_id                               = var.server_id
  storage_endpoint                        = var.storage_endpoint
  storage_account_access_key              = var.storage_account_access_key
  storage_account_access_key_is_secondary = var.storage_account_access_key_is_secondary
  retention_in_days                       = var.retention_in_days
  log_monitoring_enabled                  = var.log_monitoring_enabled
  storage_account_subscription_id         = var.storage_account_subscription_id
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  count                          = var.extended_auditing_enabled == "true" ? 1 : 0
  name                           = "sql_server_diag_setting"
  target_resource_id             = var.target_resource_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub_name

  log {
    category = "SQLSecurityAuditEvents"
    enabled = true

    retention_policy {
      enabled = false
    }
  }
}*/