location                = "uksouth"
#rg_name                 = "${var.prefix}-${var.env}-${var.content}-${var.location}-rg"
#asp_resource_group_name = "asp_rg01"
sku_name                = "P1v3"
content                 = "clientConfig"
tags                    = {
    environment =   "dev"
}

# Autoscale setting

capacity_default            = "1"
capacity_minimum            = "1"
capacity_maximum            = "3"

scale_out_metric_name       = "CpuPercentage"
scale_out_time_grain        = "PT1M"
scale_out_statistic         = "Average"
scale_out_time_window       = "PT5M"
scale_out_time_aggregation  = "Average"
scale_out_operator          = "GreaterThan"
scale_out_threshold         = 80

scale_in_metric_name        = "CpuPercentage"
scale_in_time_grain         = "PT1M"
scale_in_statistic          = "Average"
scale_in_time_window        = "PT5M"
scale_in_time_aggregation   = "Average"
scale_in_operator           = "LessThan"
scale_in_threshold          = 60


# App Service

as_client_affinity_enabled              = "true"
as_client_certificate_enabled           = "false"
as_enabled                              = "true"
as_https_only                           = "true"
as_connection_string_name               = "ClientConfiguration"
as_connection_string_type               = "SQLServer"
as_connection_string_value              = "@Microsoft.KeyVault(SecretUri=https://dev-clientconfig-kv01.vault.azure.net/secrets/ConnectionStrings-DataUser/7199bcfd08be4c1f8700a8b69cf6785)"
as_identity_type                        = "SystemAssigned"
as_auth_settings_enabled                = "false"
as_site_config_always_on                = "true"
as_site_config_managed_pipeline_mode    = "Integrated"
as_site_config_ftps_state               = "Disabled"
as_site_config_http2_enabled            = "true"
as_site_config_websockets_enabled       = "false"
as_site_config_minimum_tls_version      = "1.2"
as_app_stack_dotnet_version             = "3.1"
as_http_logs_retention_days             = "365"
as_http_logs_retention_mb               = "35"
as_http_logs_request_tracing            = "true"
as_https_logs_detailed_error_messages   = "true"

as_app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "3f5e29ff-9e74-4353-82ee-ff531f981f2"
}