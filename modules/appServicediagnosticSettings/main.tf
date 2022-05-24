resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                           = var.name
  target_resource_id             = var.target_resource_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  storage_account_id             = var.storage_account_id

  log {
    category = "AppServiceConsoleLogs"
    enabled  = var.app_service_console_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_console_logs_retention
    }
  }

  log {
    category = "AppServiceHTTPLogs"
    enabled  = var.app_service_http_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_http_logs_retention
    }
  }

  log {
    category = "AppServiceAuditLogs"
    enabled  = var.app_service_audit_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_audit_logs_retention
    }
  }

  log {
    category = "AppServiceAppLogs"
    enabled  = var.app_service_app_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_app_logs_retention
    }
  }

  log {
    category = "AppServiceIPSecAuditLogs"
    enabled  = var.app_service_ipsec_audit_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_ipsec_audit_logs_retention
    }
  }

  log {
    category = "AppServicePlatformLogs"
    enabled  = var.app_service_platform_logs_enabled

    retention_policy {
      enabled = true
      days    = var.app_service_platform_logs_retention
    }
  }

  dynamic "log" {
    for_each = var.app_service_file_audit_logs_enabled == "true" ? [1] : []
    content {
      category = "AppServiceFileAuditLogs"
      enabled  = var.app_service_file_audit_logs_enabled

      retention_policy {
        enabled = true
        days    = var.app_service_file_audit_logs_retention
      }
    }
  }

  dynamic "log" {
    for_each = var.app_service_avscan_audit_logs_enabled == "true" ? [1] : []
    content {
      category = "AppServiceAntivirusScanAuditLogs"
      enabled  = var.app_service_avscan_audit_logs_enabled

      retention_policy {
        enabled = true
        days    = var.app_service_avscan_audit_logs_retention
      }
    }
  }
}