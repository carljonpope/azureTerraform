resource "azurerm_linux_web_app" "app_service" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = var.app_service_plan_id
  client_affinity_enabled     = var.client_affinity_enabled
  client_certificate_enabled  = var.client_certificate_enabled
  enabled                     = var.enabled
  https_only                  = var.https_only
  app_settings                = var.app_settings
  tags                        = var.tags

  site_config {
    always_on               = var.site_config_always_on
    managed_pipeline_mode   = var.site_config_managed_pipeline_mode
    ftps_state              = var.site_config_ftps_state
    http2_enabled           = var.site_config_http2_enabled
    websockets_enabled      = var.site_config_websockets_enabled
    minimum_tls_version     = var.site_config_minimum_tls_version
    vnet_route_all_enabled  = var.site_config_route_all_enabled
  

    application_stack {
      dotnet_version = var.app_stack_dotnet_version
    }
  }
  auth_settings {
    enabled = var.auth_settings_enabled
  }
  connection_string {
    name = var.connection_string_name
    type = var.connection_string_type
    value= var.connection_string_value
  }

  identity {
    type = var.identity_type
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = var.http_logs_retention_days
        retention_in_mb   = var.http_logs_retention_mb
      }
    }
    failed_request_tracing  = var.http_logs_request_tracing
    detailed_error_messages = var.https_logs_detailed_error_messages
  }

}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id  = var.app_service_id
  subnet_id       = var.vnet_integration_subnet_id
}

