variable "prefix" {
  default     = "br-az-ics-fcs"
  description = "Resource name prefix."
}

variable "location" {
  description = "The Azure region in which resources should be deployed."
}

variable "env" {
  description = "The environment in which the resource will be deployed"
}

variable "content" {
  description = "The type of content in the resource group, e.g application name, or network resources"
}

variable "tags" {
  description = "Tags to be applied to each resource."
}

# App Service Plan

variable "asp_sku_name" {
  description = "The App Service Plan SKU."
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

variable "kv_bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
}

variable "kv_default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable "kv_ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
}

variable "kv_virtual_network_subnet_ids" {
  description = "One or more Subnet IDs which should be able to access this Key Vault."
}

# Key vault secret

variable "kvs_value" {
  description = "Specifies the value of the Key Vault Secret."
  default = "Placeholder"
}

variable "kvs_content_type" {
  description = "Specifies the content type for the Key Vault Secret."
}

variable "kvs_not_before_date" {
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "kvs_expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}

# Key Vault Access Policy

variable "kv_key_permissions" {
  description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
}

variable "kv_secret_permissions" {
  description = "List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "kv_certificate_permissions" {
  description = "List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}

variable "kv2_key_permissions" {
  description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
}

variable "kv2_secret_permissions" {
  description = "List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
}

variable "kv2_certificate_permissions" {
  description = "List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
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

# Redis Cache

variable "rc_capacity" {
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
}

variable "rc_family" {
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
}

variable "rc_sku_name" {
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
}

variable "rc_enable_non_ssl_port" {
  description = "Enable the non-SSL port (6379) - disabled by default."
}

variable "rc_minimum_tls_version" {
  description = "The minimum TLS version. Defaults to 1.0."
}

variable "rc_private_static_ip_address" {
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
}

variable "rc_public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. Defaults to true."
}

variable "rc_redis_version" {
  description = "Redis version. Only major version needed. Valid values: 4, 6."
}

variable "rc_replicas_per_master" {
  description = "Amount of replicas to create per master for this Redis Cache."
}

variable "rc_replicas_per_primary" {
  description = "Amount of replicas to create per primary for this Redis Cache. If both replicas_per_primary and replicas_per_master are set, they need to be equal."
}

variable "rc_tenant_settings" {
  description = "A mapping of tenant settings to assign to the resource."
}

variable "rc_shard_count" {
  description = "Only available when using the Premium SKU The number of Shards to create on the Redis Cluster."
}

variable "rc_subnet_id" {
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created."
}

variable "rc_tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "rc_zones" {
  description = "Specifies a list of Availability Zones in which this Redis Cache should be located. Changing this forces a new Redis Cache to be created."
}

variable "rc_aof_backup_enabled" {
  description = "Enable or disable AOF persistence for this Redis Cache"
}

variable "rc_aof_storage_connection_string_0" {
  description = "First Storage Account connection string for AOF persistence."
}

variable "rc_aof_storage_connection_string_1" {
  description = "Second Storage Account connection string for AOF persistence."
}

variable "rc_enable_authentication" {
  description = "If set to false, the Redis instance will be accessible without authentication. Defaults to true."
}

variable "rc_maxmemory_reserved" {
  description = "Value in megabytes reserved for non-cache usage e.g. failover. Defaults are shown below."
}

variable "rc_maxmemory_delta" {
  description = "The max-memory delta for this Redis instance. Defaults are shown below."
}

variable "rc_maxmemory_policy" {
  description = "How Redis will select what to remove when maxmemory is reached. Defaults are shown below."
}

variable "rc_maxfragmentationmemory_reserved" {
  description = "Value in megabytes reserved to accommodate for memory fragmentation. Defaults are shown below."
}

variable "rc_rdb_backup_enabled" {
  description = "Is Backup Enabled? Only supported on Premium SKUs."
}

variable "rc_rdb_backup_frequency" {
  description = "The Backup Frequency in Minutes. Only supported on Premium SKUs. Possible values are: 15, 30, 60, 360, 720 and 1440."
}

variable "rc_rdb_backup_max_snapshot_count" {
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKUs."
}

variable "rc_rdb_storage_connection_string" {
  description = "The Connection String to the Storage Account. Only supported for Premium SKUs"
}

variable "rc_notify_keyspace_events" {
  description = "Keyspace notifications allows clients to subscribe to Pub/Sub channels in order to receive events affecting the Redis data set in some way. Reference"
}

variable "rc_day_of_week" {
  description = "the Weekday name - possible values include Monday, Tuesday, Wednesday etc."
}

variable "rc_start_hour_utc" {
  description = "the Start Hour for maintenance in UTC - possible values range from 0 - 23."
}

variable "rc_maintenance_window" {
  description = "The ISO 8601 timespan which specifies the amount of time the Redis Cache can be updated. Defaults to PT5H."
}

# SQL Server

variable "ss_sql_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable "ss_administrator_login" {
  description = "The administrator login name for the new server. Required unless azuread_authentication_only in the azuread_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created."
}

variable "ss_administrator_login_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy. Required unless azuread_authentication_only in the azuread_administrator block is true."
}

variable "ss_connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
}

variable "ss_minimum_tls_version" {
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and"
}

variable "ss_public_network_access_enabled" {
  description = "Whether public network access is allowed for this server. Defaults to true."
}

variable "ss_outbound_network_restriction_enabled" {
  description = "Whether outbound network traffic is restricted for this server. Defaults to false."
}

variable "ss_primary_user_assigned_identity_id" {
  description = "Specifies the primary user managed identity id. Required if type is UserAssigned and should be combined with user_assigned_identity_ids."
}

variable "ss_login_username" {
  description = "The login username of the Azure AD Administrator of this SQL Server."
}

variable "ss_object_id" {
  description = "The object id of the Azure AD Administrator of this SQL Server."
}

variable "ss_tenant_id" {
  description = "The tenant id of the Azure AD Administrator of this SQL Server."
}

variable "ss_azuread_authentication_only" {
  description = "Specifies whether only AD Users and administrators (like azuread_administrator.0.login_username) can be used to login, or also local database users (like administrator_login). When true, the administrator_login and administrator_login_password properties can be omitted."
}

variable "ss_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this API Management Service. Possible values are SystemAssigned,"
}

variable "ss_identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this API Management Service."
}

# SQL Server VNet Rule

variable "ss_subnet_id" {
  description = "The ID of the subnet from which the SQL server will accept communications."  
}

variable "ss_ignore_missing_vnet_service_endpoint" {
  description = "Create the virtual network rule before the subnet has the virtual network service endpoint enabled. Defaults to false."  
}

# SQL Database


variable "db_auto_pause_delay_in_minutes" {
  description = "vaTime in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases.lue"
}

variable "db_create_mode" {
  description = "The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary."
}

variable "db_creation_source_database_id" {
  description = "The ID of the source database from which to create the new database. This should only be used for databases with create_mode values that use another database as reference. Changing this forces a new resource to be created."
}

variable "db_collation" {
  description = "Specifies the collation of the database. Changing this forces a new resource to be created."
}

variable "db_elastic_pool_id" {
  description = "Specifies the ID of the elastic pool containing this database."
}

variable "db_geo_backup_enabled" {
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
}

variable "db_ledger_enabled" {
  description = "A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created."
}

variable "db_license_type" {
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}

variable "db_max_size_gb" {
  description = "The max size of the database in gigabytes."
}

variable "db_min_capacity" {
  description = "Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases."
}

variable "db_restore_point_in_time" {
  description = "Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database. This property is only settable for create_mode= PointInTimeRestore databases."
}

variable "db_recover_database_id" {
  description = "The ID of the database to be recovered. This property is only applicable when the create_mode is Recovery."
}

variable "db_restore_dropped_database_id" {
  description = "The ID of the database to be restored. This property is only applicable when the create_mode is Restore."
}

variable "db_read_replica_count" {
  description = "The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases."
}

variable "db_read_scale" {
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
}

variable "db_sample_name" {
  description = "Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT."
}

variable "db_sku_name" {
  description = "Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will force a new resource to be created."
}

variable "db_storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database. Possible values are Geo, GeoZone, Local and Zone. The default value is Geo."
}

variable "db_transparent_data_encryption_enabled" {
  description = "If set to true, Transparent Data Encryption will be enabled on the database. Defaults to true."
}

variable "db_zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
}

variable "db_audit_storage_account_access_key" {
  description = "Specifies the access key to use for the auditing storage account."
}

variable "db_audit_storage_endpoint" {
  description = "Specifies the blob storage endpoint"
}

variable "db_audit_storage_account_access_key_is_secondary" {
  description = "Specifies whether storage_account_access_key value is the storage's secondary key."
}

variable "db_audit_retention_in_days" {
  description = "Specifies the number of days to retain logs for in the storage account."
}

variable "db_audit_log_monitoring_enabled" {
  description = "Enable audit events to Azure Monitor?"
}

variable "db_lt_weekly_retention" {
  description = "The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
}

variable "db_lt_monthly_retention" {
  description = "The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
}

variable "db_lt_yearly_retention" {
  description = "The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
}

variable "db_lt_week_of_year" {
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
}

variable "db_st_retention_days" {
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
}

variable "db_st_backup_interval_in_hours" {
  description = "The hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24. Defaults to 12 hours."
}

variable "db_td_state" {
  description = "The State of the Policy. Possible values are Enabled, Disabled or New."
}

variable "db_td_disabled_alerts" {
  description = "Specifies a list of alerts which should be disabled. Possible values include Access_Anomaly, Sql_Injection and Sql_Injection_Vulnerability."
}

variable "db_td_email_account_admins" {
  description = "Should the account administrators be emailed when this alert is triggered?"
}

variable "db_td_email_addresses" {
  description = "A list of email addresses which alerts should be sent to."
}

variable "db_td_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
}

variable "db_td_storage_account_access_key" {
  description = "Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled."
}

variable "db_td_storage_endpoint" {
  description = "Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs. Required if state is Enabled."
}

# SQL Auditing

variable "sau_extended_auditing_enabled" {
  description = "Whether to enable the extended auditing policy. Possible values are true and false. Defaults to true."

}

variable "sau_storage_endpoint" {
  description = " The blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all extended auditing logs."

}

variable "sau_storage_account_access_key" {
  description = "The access key to use for the auditing storage account."

}

variable "sau_storage_account_access_key_is_secondary" {
  description = "Is storage_account_access_key value the storage's secondary key?"

}

variable "sau_retention_in_days" {
  description = "The number of days to retain logs for in the storage account."

}

variable "sau_log_monitoring_enabled" {
  description = "Enable audit events to Azure Monitor? To enable server audit events to Azure Monitor, please enable its main database audit events to Azure Monitor."

}

variable "sau_storage_account_subscription_id" {
  description = "The ID of the Subscription containing the Storage Account."

}

variable "sau_eventhub_authorization_rule_id" {
  description = "Authorisation rule ID of the Eventhub namespace"
}

variable "sau_eventhub_name" {
  description = "The name of the Eventhub"
}

variable "sau_audit_scope" {
  description = "The scope at which the Role Assignment applies to"
}

variable "sau_audit_role_definition_name" {
  description = "The name of a built-in Role. Changing this forces a new resource to be created."
}