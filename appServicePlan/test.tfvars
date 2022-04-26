location                = "uksouth"
#rg_name                 = "${var.prefix}-${var.env}-${var.content}-${var.location}-rg"
#asp_resource_group_name = "asp_rg01"
sku_name                = "P1v3"
content                 = "clientConfig"
tags                    = {
    environment =   "dev"
}

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