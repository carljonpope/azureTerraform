variable "location" {
    description = "The Azure region in which resources should be deployed."
}

variable "asp_sku_name" {
    description = "The App Service Plan SKU."
}


variable "prefix" {
  default       = "br-az-ics-fcs"
  description = "Resource name prefix."

}

variable "env" {
    default     = "dev"
    description = "The environment in which the resource will be deployed"
}


variable "tags" {
    description = "Tags to be applied to each resource."
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

variable "as_site_config_route_all_enabled" {
    description = "Should all outbound traffic have Virtual Network Security Groups and User Defined Routes applied?"
}

# VNet Integration

variable "as_vnet_integration_subnet_id" {
    description = "The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)."
}

# Diagnostic Settings

variable "diag_eventhub_name" {
    description = "Specifies the name of the Event Hub where Diagnostics Data should be sent. Changing this forces a new resource to be created."
}

variable "diag_eventhub_authorization_rule_id" {
    description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Changing this forces a new resource to be created."
}

variable "diag_storage_account_id" {
    description = "The ID of the Storage Account where logs should be sent. Changing this forces a new resource to be created."
}

variable "diag_app_service_console_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_console_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_http_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_http_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_audit_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_audit_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_file_audit_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_file_audit_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_app_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_app_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_ipsec_audit_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_ipsec_audit_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_platform_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_platform_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

variable "diag_app_service_avscan_audit_logs_enabled" {
    description = "The name of a Diagnostic Log Category for this Resource."
}

variable "diag_app_service_avscan_audit_logs_retention" {
    description = "The number of days for which this Retention Policy should apply."
}

# Key Vault

variable "kv_enable_rbac_authorization" {
    description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
}

variable "kv_enabled_for_deployment" {
    description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}

variable "kv_enabled_for_disk_encryption" {
    description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "kv_enabled_for_template_deployment" {
    description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}

variable "kv_purge_protection_enabled" {
    description = "Is Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "kv_sku_name" {
    description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "kv_soft_delete_retention_days" {
    description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}


# Key Vault Access Policy
variable "kv_object_id" {
    description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
}

variable "kv_key_permissions" {
    description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
}

variable "kv_secret_permissions" {
    description = "List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "kv_certificate_permissions" {
    description = "List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "kv_object_id_2" {
    description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
}

# DNS Private Zone

variable "dns_privatezone_name" {
    description = "The name of the Private DNS Zone. Must be a valid domain name."
}

# DNS Private Zone VNet Link

variable "dnslink_vnet_id" {
    description = "The ID of the Virtual Network that should be linked to the DNS Zone. Changing this forces a new resource to be created."
  
}

# Private Link Endpoint

variable "ple_subresource_names" {
    description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created."
}

variable "ple_is_manual_connection" {
    description = "Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
}

variable "ple_private_dns_zone_group" {
    description = "Specifies the Name of the Private DNS Zone Group. Changing this forces a new private_dns_zone_group resource to be created."
}

variable "ple_vnet_private_endpoint_subnet_id" {
    description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
}

# Servicebus namespace

variable "sb_sku" {
  description = "Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource."
}

variable "sb_capacity" {
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
}

variable "sb_local_auth_enabled" {
  description = "Whether or not SAS authentication is enabled for the Service Bus namespace. Defaults to true."
}

variable "sb_zone_redundant" {
  description = "Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false."
}

variable "sb_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this ServiceBus Namespace. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "sb_identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this API Management Service."
}

# Servicebus Queue

variable "sbq_lock_duration" {
    description = "The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes. Defaults to 1 minute (PT1M)."
}

variable "sbq_max_message_size_in_kilobytes" {
    description = "Integer value which controls the maximum size of a message allowed on the queue for Premium SKU."
}

variable "sbq_max_size_in_megabytes" {
    description = "Integer value which controls the size of memory allocated for the queue. Defaults to 1024."
}

variable "sbq_requires_duplicate_detection" {
    description = "Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created. Defaults to false."
}

variable "sbq_requires_session" {
    description = "Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created. Defaults to false."
}

variable "sbq_default_message_ttl" {
    description = "The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself."
}

variable "sbq_dead_lettering_on_message_expiration" {
    description = "Boolean flag which controls whether the Queue has dead letter support when a message expires. Defaults to false."
}

variable "sbq_duplicate_detection_history_time_window" {
    description = "The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes (PT10M)."
}

variable "sbq_max_delivery_count" {
    description = "Integer value which controls when a message is automatically dead lettered. Defaults to 10."
}

variable "sbq_status" {
    description = "The status of the Queue. Possible values are Active, Creating, Deleting, Disabled, ReceiveDisabled, Renaming, SendDisabled, Unknown. Note that Restoring is not accepted. Defaults to Active."
}

variable "sbq_enable_batched_operations" {
    description = "Boolean flag which controls whether server-side batched operations are enabled. Defaults to true."
}

variable "sbq_auto_delete_on_idle" {
    description = "The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes."
}

variable "sbq_enable_partitioning" {
    description = "Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to false for Basic and Standard. For Premium, it MUST be set to true."
}

# Servicebus topic

variable "sbt_status" {
  description = "The Status of the Service Bus Topic. Acceptable values are Active or Disabled. Defaults to Active."
}

variable "sbt_auto_delete_on_idle" {
  description = "The ISO 8601 timespan duration of the idle interval after which the Topic is automatically deleted, minimum of 5 minutes."
}

variable "sbt_default_message_ttl" {
  description = "The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself."
}

variable "sbt_duplicate_detection_history_time_window" {
  description = "The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes. (PT10M)"
}

variable "sbt_enable_batched_operations" {
  description = "Boolean flag which controls if server-side batched operations are enabled. Defaults to false."
}

variable "sbt_enable_express" {
  description = "Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false."
}

variable "sbt_enable_partitioning" {
  description = "Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers. Defaults to false. Changing this forces a new resource to be created."
}

variable "sbt_max_message_size_in_kilobytes" {
  description = "Integer value which controls the maximum size of a message allowed on the topic for Premium SKU."
}

variable "sbt_max_size_in_megabytes" {
  description = "Integer value which controls the size of memory allocated for the topic."
}

variable "sbt_requires_duplicate_detection" {
  description = "Boolean flag which controls whether the Topic requires duplicate detection. Defaults to false. Changing this forces a new resource to be created."
}

variable "sbt_support_ordering" {
  description = "Boolean flag which controls whether the Topic supports ordering. Defaults to false."
}

# Servicebus subscription

variable "sbs_max_delivery_count" {
  description = "The maximum number of deliveries."
}

variable "sbs_auto_delete_on_idle" {
  description = "The idle interval after which the topic is automatically deleted as an ISO 8601 duration. The minimum duration is 5 minutes or PT5M."
}

variable "sbs_default_message_ttl" {
  description = "The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself."
}

variable "sbs_lock_duration" {
  description = "The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or P0DT0H1M0S . The maximum value is 5 minutes or P0DT0H5M0S ."
}

variable "sbs_dead_lettering_on_message_expiration" {
  description = "Boolean flag which controls whether the Subscription has dead letter support when a message expires. Defaults to false."
}

variable "sbs_dead_lettering_on_filter_evaluation_error" {
  description = "Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true."
}

variable "sbs_enable_batched_operations" {
  description = "Boolean flag which controls whether the Subscription supports batched operations. Defaults to false."
}

variable "sbs_requires_session" {
  description = "Boolean flag which controls whether this Subscription supports the concept of a session. Defaults to false. Changing this forces a new resource to be created."
}

variable "sbs_forward_to" {
  description = "The name of a Queue or Topic to automatically forward messages to."
}

variable "sbs_forward_dead_lettered_messages_to" {
  description = "The name of a Queue or Topic to automatically forward Dead Letter messages to."
}

variable "sbs_status" {
  description = "The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active."
}