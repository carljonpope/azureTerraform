location                = "uksouth"
asp_sku_name                = "B1"
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
as_site_config_route_all_enabled        = "true"
as_app_stack_dotnet_version             = "3.1"
as_http_logs_retention_days             = "365"
as_http_logs_retention_mb               = "35"
as_http_logs_request_tracing            = "true"
as_https_logs_detailed_error_messages   = "true"
as_vnet_integration_subnet_id           = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet2"

as_app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "3f5e29ff-9e74-4353-82ee-ff531f981f2"
}

# Diagnostic settings

diag_eventhub_name                              = "cjptest-eh01"
diag_eventhub_authorization_rule_id             = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/storage/providers/Microsoft.EventHub/namespaces/cjptest-eh01/authorizationRules/RootManageSharedAccessKey"
diag_storage_account_id                         = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Storage/storageAccounts/cjptest02"
diag_app_service_console_logs_enabled           = "true"
diag_app_service_console_logs_retention         = "365"
diag_app_service_http_logs_enabled              = "true"
diag_app_service_http_logs_retention            = "365"
diag_app_service_audit_logs_enabled             = "true"
diag_app_service_audit_logs_retention           = "365"
diag_app_service_file_audit_logs_enabled        = "false"
diag_app_service_file_audit_logs_retention      = "365"
diag_app_service_app_logs_enabled               = "true"
diag_app_service_app_logs_retention             = "365"
diag_app_service_ipsec_audit_logs_enabled       = "true"
diag_app_service_ipsec_audit_logs_retention     = "365"
diag_app_service_platform_logs_enabled          = "true" 
diag_app_service_platform_logs_retention        = "365"
diag_app_service_avscan_audit_logs_enabled      = "false"
diag_app_service_avscan_audit_logs_retention    = "365"

# Key Vault

kv_enable_rbac_authorization        = "false"
kv_enabled_for_deployment           = "false"
kv_enabled_for_disk_encryption      = "false"
kv_enabled_for_template_deployment  = "false"
kv_purge_protection_enabled         = "false"
kv_soft_delete_retention_days       = "90"
kv_sku_name                         = "standard"

# Key Vault Access Policy
kv_object_id                        = "9ea63675-1896-4d80-be7a-312bb3314682"
kv_key_permissions                  = [
            "Get",
            "List",
            "Update",
        ]
kv_secret_permissions               = [
            "Get",
            "List",
]
kv_certificate_permissions          = [
            "Get",
]
kv_object_id_2                      = "d2ae3367-7f7d-42ce-a386-da8336b5e6ee"

# DNS Private Zone

dns_privatezone_name    = "privatelink.azurewebsites.net"

# DNS Private Zone VNet Link

dnslink_vnet_id = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1"

# Private Link Endpoint

ple_subresource_names               = ["sites"]
ple_is_manual_connection            = "false"
ple_private_dns_zone_group          = "privatednszonegroup"
ple_vnet_private_endpoint_subnet_id = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet3"