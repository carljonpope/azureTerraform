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

  depends_on = [
    azurerm_role_assignment.audit_contributor
  ]
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  count                          = var.extended_auditing_enabled == "true" ? 1 : 0
  name                           = "sql_server_diag_setting"
  target_resource_id             = var.target_resource_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub_name

  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_role_assignment" "audit_contributor" {
  scope                = var.audit_scope
  role_definition_name = var.audit_role_definition_name
  principal_id         = var.audit_principal_id
}