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

# Autoscale setting
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

# App Service

variable "as_client_affinity_enabled" {
    description = "Should Client Affinity be enabled?"
}

variable "as_client_certificate_enabled" {
    description = "Should Client Certificates be enabled?"
}

variable "as_enabled" {
    description = "Should the Linux Web App be enabled? Defaults to true."
}

variable "as_https_only" {
    description = "Should the Linux Web App require HTTPS connections."
}

variable "as_app_settings" {
    description = "A map of key-value pairs of App Settings."
}

variable "as_auth_settings_enabled" {
    description = "Should the Authentication / Authorization feature be enabled for the Linux Web App?"
}

variable "as_connection_string_name" {
    description = "The name of the Connection String."
}

variable "as_connection_string_type" {
    description = "Type of database. Possible values include: MySQL, SQLServer, SQLAzure, Custom, NotificationHub, ServiceBus, EventHub, APIHub, DocDb, RedisCache, and PostgreSQL."
}

variable "as_connection_string_value" {
    description = "The connection string value."
}

variable "as_identity_type" {
    description = "Specifies the type of Managed Service Identity that should be configured on this Linux Web App. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "as_app_stack_dotnet_version" {
      description = "The version of .Net to use. Possible values include 3.1, 5.0, and 6.0."
}

variable "as_http_logs_retention_days" {
  description = "The retention period in days. A value of 0 means no retention."
}

variable "as_http_logs_retention_mb" {
  description = "The maximum size in megabytes that log files can use."
}

variable "as_http_logs_request_tracing" {
  description = "Should failed request tracing be enabled."
}

variable "as_https_logs_detailed_error_messages" {
  description = "Should detailed error messages be enabled."
}

variable "as_site_config_always_on" {
    description = "If this Linux Web App is Always On enabled. Defaults to false."
}

variable "as_site_config_managed_pipeline_mode" {
    description = "Managed pipeline mode. Possible values include: Integrated, Classic."
}

variable "as_site_config_ftps_state" {
        description = "The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled."
}

variable "as_site_config_http2_enabled" {
        description = "Should HTTP2 be enabled?"
}

variable "as_site_config_websockets_enabled" {
        description = "Should Web Sockets be enabled. Defaults to false."
}

variable "as_site_config_minimum_tls_version" {
        description = "The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2."
}