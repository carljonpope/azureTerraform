variable "extended_auditing_enabled" {
  description = "Whether to enable the extended auditing policy. Possible values are true and false. Defaults to true."

}

variable "server_id" {
  description = "The ID of the SQL Server to set the extended auditing policy. Changing this forces a new resource to be created."

}

variable "storage_endpoint" {
  description = " The blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all extended auditing logs."

}

variable "storage_account_access_key" {
  description = "The access key to use for the auditing storage account."

}

variable "storage_account_access_key_is_secondary" {
  description = "Is storage_account_access_key value the storage's secondary key?"

}

variable "retention_in_days" {
  description = "The number of days to retain logs for in the storage account."

}

variable "log_monitoring_enabled" {
  description = "Enable audit events to Azure Monitor? To enable server audit events to Azure Monitor, please enable its main database audit events to Azure Monitor."

}

variable "storage_account_subscription_id" {
  description = "The ID of the Subscription containing the Storage Account."

}

variable "target_resource_id" {
  description = "The SQL Server resource ID"

}

variable "eventhub_authorization_rule_id" {
  description = "Authorisation rule ID of the Eventhub namespace"
}

variable "eventhub_name" {
  description = "The name of the Eventhub"
}

variable "audit_scope" {
  description = "The scope at which the Role Assignment applies to"
}

variable "audit_role_definition_name" {
  description = "The name of a built-in Role. Changing this forces a new resource to be created."
}

variable "audit_principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
}