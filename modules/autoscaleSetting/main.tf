resource "azurerm_monitor_autoscale_setting" "autoscaleSetting" {
    name                = var.name
    resource_group_name = var.resource_group_name
    location            = var.location
    target_resource_id  = var.app_service_plan_id
    profile {
        name = "default"
        capacity {
            default = var.capacity_default
            minimum = var.capacity_minimum
            maximum = var.capacity_maximum
        }
        rule {
            metric_trigger {
              metric_name           = var.scale_out_metric_name
              metric_resource_id    = var.app_service_plan_id
              time_grain            = var.scale_out_time_grain
              statistic             = var.scale_out_statistic
              time_window           = var.scale_out_time_window
              time_aggregation      = var.scale_out_time_aggregation
              operator              = var.scale_out_operator
              threshold             = var.scale_out_threshold
            }
            scale_action {
              direction = "Increase"
              type      = var.scale_out_type
              value     = var.scale_out_value
              cooldown  = var.scale_out_cooldown
            }
        }
        rule {
            metric_trigger {
              metric_name           = var.scale_in_metric_name
              metric_resource_id    = var.app_service_plan_id
              time_grain            = var.scale_in_time_grain
              statistic             = var.scale_in_statistic
              time_window           = var.scale_in_time_window
              time_aggregation      = var.scale_in_time_aggregation
              operator              = var.scale_in_operator
              threshold             = var.scale_in_threshold
            }
            scale_action {
              direction = "Decrease"
              type      = var.scale_in_type
              value     = var.scale_in_value
              cooldown  = var.scale_in_cooldown
            }
        }
    }
}