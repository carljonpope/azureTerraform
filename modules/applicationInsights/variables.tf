variable "name" {
  description = "specifies the name of the application insights. Changing this forces a new resource tobe created"
}

variable "location" {
  description = "The location where the application insights resource is created. Changing this forces a new resource tobe created"
}

variable "resource_group_name" {
  description = "Resource group name that the application insights resource will be created in"
}

variable "application_type" {
  description = "Specifies the type of Application Insights to create. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created."
}

variable "daily_data_cap_in_gb" {
  description = "Specifies the Application Insights component daily data volume cap in GB"
}

variable "daily_data_cap_notifications_disabled" {
  description = "Specifies if a notification email will be send when the daily data volume cap is met. Defaults to false"
}

variable "sampling_percentage" {
 description = "Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry"
}

variable "retention_in_days" {
  description = "Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90"
}

variable "disable_ip_masking" {
  description = "By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
}
