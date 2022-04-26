variable "location" {

}

variable "sku_name" {
    
}

variable "prefix" {
  default       = "br-az-ics-fcs"

}

variable "env" {
    default     = "dev"
    description = "The environment in which the resource will be deployed"
}


variable "tags" {
    
}

variable "content" {
    description = "The type of content in the resource group, e.g application name, or network resources"
}

variable "capacity_default" {
    description = "The number of instances that are available for scaling if metrics are not available for evaluation. The default is only used if the current instance count is lower than the default. Valid values are between 0 and 1000."
}

variable "capacity_minimum" {
    description = "The minimum number of instances for this resource. Valid values are between 0 and 1000."
}

variable "capacity_maximum" {
    description = "The maximum number of instances for this resource. Valid values are between 0 and 1000."
}

variable "scale_out_metric_name" {
    description = "The name of the metric that defines what the rule monitors, such as Percentage CPU for Virtual Machine Scale Sets and CpuPercentage for App Service Plan."
}

variable "scale_out_time_grain" {
    description = "Specifies the granularity of metrics that the rule monitors, which must be one of the pre-defined values returned from the metric definitions for the metric. This value must be between 1 minute and 12 hours an be formatted as an ISO 8601 string."
}

variable "scale_out_statistic" {
    description = "Specifies how the metrics from multiple instances are combined. Possible values are Average, Min and Max."
}

variable "scale_out_time_window" {
    description = "Specifies the time range for which data is collected, which must be greater than the delay in metric collection (which varies from resource to resource). This value must be between 5 minutes and 12 hours and be formatted as an ISO 8601 string."
}

variable "scale_out_time_aggregation" {
    description = "Specifies how the data that's collected should be combined over time. Possible values include Average, Count, Maximum, Minimum, Last and Total."
}

variable "scale_out_operator" {
    description = "Specifies the operator used to compare the metric data and threshold. Possible values are: Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan, LessThanOrEqual."
}

variable "scale_out_threshold" {
    description = "Specifies the threshold of the metric that triggers the scale action."
}

variable "scale_in_metric_name" {
    description = "The name of the metric that defines what the rule monitors, such as Percentage CPU for Virtual Machine Scale Sets and CpuPercentage for App Service Plan."

}

variable "scale_in_time_grain" {
    description = "Specifies the granularity of metrics that the rule monitors, which must be one of the pre-defined values returned from the metric definitions for the metric. This value must be between 1 minute and 12 hours an be formatted as an ISO 8601 string."

}

variable "scale_in_statistic" {
    description = "Specifies how the metrics from multiple instances are combined. Possible values are Average, Min and Max."

}

variable "scale_in_time_window" {
    description = "Specifies the time range for which data is collected, which must be greater than the delay in metric collection (which varies from resource to resource). This value must be between 5 minutes and 12 hours and be formatted as an ISO 8601 string."

}

variable "scale_in_time_aggregation" {
    description = "Specifies how the data that's collected should be combined over time. Possible values include Average, Count, Maximum, Minimum, Last and Total."

}

variable "scale_in_operator" {
    description = "Specifies the operator used to compare the metric data and threshold. Possible values are: Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan, LessThanOrEqual."

}

variable "scale_in_threshold" {
    description = "Specifies the threshold of the metric that triggers the scale action."
}

variable "scale_out_type" {
    default     = "ChangeCount"
    description = "The type of action that should occur. Possible values are ChangeCount, ExactCount, PercentChangeCount and ServiceAllowedNextValue."
}

variable "scale_out_value" {
    default     = "1"
    description = "The number of instances involved in the scaling action. Defaults to 1."
}

variable "scale_out_cooldown" {
    default     = "PT1M"
    description = "The amount of time to wait since the last scaling action before this action occurs. Must be between 1 minute and 1 week and formatted as a ISO 8601 string."
}

variable "scale_in_type" {
    default     = "ChangeCount"
    description = "The type of action that should occur. Possible values are ChangeCount, ExactCount, PercentChangeCount and ServiceAllowedNextValue."
}

variable "scale_in_value" {
    default     = "1"
    description = "The number of instances involved in the scaling action. Defaults to 1."
}

variable "scale_in_cooldown" {
    default     = "PT1M"
    description = "The amount of time to wait since the last scaling action before this action occurs. Must be between 1 minute and 1 week and formatted as a ISO 8601 string."
}