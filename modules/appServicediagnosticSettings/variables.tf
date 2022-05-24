variable "name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
}

variable "target_resource_id" {
  description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
}

variable "eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent. Changing this forces a new resource to be created."
}

variable "eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Changing this forces a new resource to be created."
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where logs should be sent. Changing this forces a new resource to be created."
}

variable "app_service_console_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_console_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_http_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_http_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_audit_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_audit_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_file_audit_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_file_audit_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_app_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_app_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_ipsec_audit_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_ipsec_audit_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_platform_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_platform_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}

variable "app_service_avscan_audit_logs_enabled" {
  description = "The name of a Diagnostic Log Category for this Resource."
}

variable "app_service_avscan_audit_logs_retention" {
  description = "The number of days for which this Retention Policy should apply."
}