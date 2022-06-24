resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  enable_rbac_authorization       = var.enable_rbac_authorization
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  sku_name                        = var.sku_name
  tags                            = var.tags

  network_acls {
    bypass                      = var.bypass
    default_action              = var.default_action
    ip_rules                    = var.ip_rules
    virtual_network_subnet_ids  = var.virtual_network_subnet_ids
  }

}