data "azurerm_client_config" "current" {

}


module "resource_group" {
    source              = "../modules/resourceGroup"
    name                = "${var.prefix}-${var.env}-${var.content}-${var.location}-rg01"
    location            = var.location
    tags                = var.tags
}

module "app_service_plan" {
    source              = "../modules/appServicePlan"
    name                = "${var.prefix}-${var.env}-${var.content}-${var.location}-asp01"
    location            = var.location
    resource_group_name = module.resource_group.resource_group_name
    os_type             = "Linux"
    sku_name            = var.asp_sku_name
    tags                = var.tags
}

module "autoscale_setting" {
    source                      = "../modules/autoscaleSetting"
    name                        = "${var.prefix}-${var.env}-${var.content}-${var.location}-ass01"
    location                    = var.location
    resource_group_name         = module.resource_group.resource_group_name
    app_service_plan_id         = module.app_service_plan.app_service_plan_id

    capacity_default            = var.capacity_default
    capacity_minimum            = var.capacity_minimum
    capacity_maximum            = var.capacity_maximum

    scale_out_metric_name       = var.scale_out_metric_name
    scale_out_time_grain        = var.scale_out_time_grain
    scale_out_statistic         = var.scale_out_statistic
    scale_out_time_window       = var.scale_out_time_window
    scale_out_time_aggregation  = var.scale_out_time_aggregation
    scale_out_operator          = var.scale_out_operator
    scale_out_threshold         = var.scale_out_threshold
    scale_out_type              = var.scale_out_type
    scale_out_value             = var.scale_out_value
    scale_out_cooldown          = var.scale_out_cooldown

    scale_in_metric_name        = var.scale_in_metric_name
    scale_in_time_grain         = var.scale_in_time_grain
    scale_in_statistic          = var.scale_in_statistic
    scale_in_time_window        = var.scale_in_time_window
    scale_in_time_aggregation   = var.scale_in_time_aggregation
    scale_in_operator           = var.scale_in_operator
    scale_in_threshold          = var.scale_in_threshold
    scale_in_type               = var.scale_in_type
    scale_in_value              = var.scale_in_value
    scale_in_cooldown           = var.scale_in_cooldown
}

module "app_service" {
    source                              = "../modules/appServiceLinux"
    name                                = "${var.prefix}-${var.env}-${var.content}-${var.location}-as01"
    location                            = var.location
    resource_group_name                 = module.resource_group.resource_group_name
    app_service_plan_id                 = module.app_service_plan.app_service_plan_id
    client_affinity_enabled             = var.as_client_affinity_enabled
    client_certificate_enabled          = var.as_client_certificate_enabled
    enabled                             = var.as_enabled
    https_only                          = var.as_https_only
    app_settings                        = var.as_app_settings
    tags                                = var.tags
    auth_settings_enabled               = var.as_auth_settings_enabled
    connection_string_name              = var.as_connection_string_name
    connection_string_type              = var.as_connection_string_type
    connection_string_value             = var.as_connection_string_value
    identity_type                       = var.as_identity_type
    site_config_always_on               = var.as_site_config_always_on
    site_config_managed_pipeline_mode   = var.as_site_config_managed_pipeline_mode
    site_config_ftps_state              = var.as_site_config_ftps_state
    site_config_http2_enabled           = var.as_site_config_http2_enabled
    site_config_websockets_enabled      = var.as_site_config_websockets_enabled
    site_config_minimum_tls_version     = var.as_site_config_minimum_tls_version
    site_config_route_all_enabled       = var.as_site_config_route_all_enabled
    app_stack_dotnet_version            = var.as_app_stack_dotnet_version
    http_logs_retention_days            = var.as_http_logs_retention_days
    http_logs_retention_mb              = var.as_http_logs_retention_mb
    http_logs_request_tracing           = var.as_http_logs_request_tracing
    https_logs_detailed_error_messages  = var.as_https_logs_detailed_error_messages
    app_service_id                      = module.app_service.app_service_id
    subnet_id                           = var.as_subnet_id
}

module "diagnostic_settings" {
    source                                  = "../modules/diagnosticSettings"
    name                                    = "${var.prefix}-${var.env}-${var.content}-${var.location}-as01-diag"
    target_resource_id                      = module.app_service.app_service_id
    eventhub_name                           = var.diag_eventhub_name
    eventhub_authorization_rule_id          = var.diag_eventhub_authorization_rule_id
    storage_account_id                      = var.diag_storage_account_id
    app_service_console_logs_enabled        = var.diag_app_service_console_logs_enabled
    app_service_console_logs_retention      = var.diag_app_service_console_logs_retention
    app_service_http_logs_enabled           = var.diag_app_service_http_logs_enabled
    app_service_http_logs_retention         = var.diag_app_service_http_logs_retention
    app_service_audit_logs_enabled          = var.diag_app_service_audit_logs_enabled
    app_service_audit_logs_retention        = var.diag_app_service_audit_logs_retention
    app_service_file_audit_logs_enabled     = var.diag_app_service_file_audit_logs_enabled
    app_service_file_audit_logs_retention   = var.diag_app_service_file_audit_logs_retention
    app_service_app_logs_enabled            = var.diag_app_service_app_logs_enabled
    app_service_app_logs_retention          = var.diag_app_service_app_logs_retention
    app_service_ipsec_audit_logs_enabled    = var.diag_app_service_ipsec_audit_logs_enabled
    app_service_ipsec_audit_logs_retention  = var.diag_app_service_ipsec_audit_logs_retention
    app_service_platform_logs_enabled       = var.diag_app_service_platform_logs_enabled
    app_service_platform_logs_retention     = var.diag_app_service_platform_logs_retention
    app_service_avscan_audit_logs_enabled   = var.diag_app_service_avscan_audit_logs_enabled
    app_service_avscan_audit_logs_retention = var.diag_app_service_avscan_audit_logs_retention
}

module "key_vault" {
    source                              = "../modules/keyVault"
    name                                = "${var.content}-${var.env}-kv01"
    location                            = var.location
    resource_group_name                 = module.resource_group.resource_group_name
    tenant_id                           = data.azurerm_client_config.current.tenant_id
    enable_rbac_authorization           = var.kv_enable_rbac_authorization
    enabled_for_deployment              = var.kv_enabled_for_deployment
    enabled_for_disk_encryption         = var.kv_enabled_for_disk_encryption
    enabled_for_template_deployment     = var.kv_enabled_for_template_deployment
    purge_protection_enabled            = var.kv_purge_protection_enabled
    soft_delete_retention_days          = var.kv_soft_delete_retention_days
    sku_name                            = var.kv_sku_name
    tags                                = var.tags

}

module "keyvault_access_policy" {
    source                  = "../modules/keyVaultAccessPolicy"
    key_vault_id            = module.key_vault.Key_vault_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = var.kv_object_id
    key_permissions         = var.kv_key_permissions
    secret_permissions      = var.kv_secret_permissions
    certificate_permissions = var.kv_certificate_permissions
}

module "keyvault_access_policy_2" {
    source                  = "../modules/keyVaultAccessPolicy"
    key_vault_id            = module.key_vault.Key_vault_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = var.kv_object_id_2
    key_permissions         = var.kv_key_permissions
    secret_permissions      = var.kv_secret_permissions
    certificate_permissions = var.kv_certificate_permissions
}