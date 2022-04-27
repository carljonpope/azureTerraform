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
    sku_name            = var.sku_name
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
    source                              = "../modules/appService"
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
    app_stack_dotnet_version            = var.as_app_stack_dotnet_version
    http_logs_retention_days            = var.as_http_logs_retention_days
    http_logs_retention_mb              = var.as_http_logs_retention_mb
    http_logs_request_tracing           = var.as_http_logs_request_tracing
    https_logs_detailed_error_messages  = var.as_https_logs_detailed_error_messages

}