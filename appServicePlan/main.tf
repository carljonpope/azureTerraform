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