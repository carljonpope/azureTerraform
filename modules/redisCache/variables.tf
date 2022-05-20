variable "name" {
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The location of the resource group."
}

variable "location" {
  description = "The name of the resource group in which to create the Redis instance."
}

variable "capacity" {
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
}

variable "family" {
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
}

variable "sku_name" {
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
}

variable "enable_non_ssl_port" {
  description = "Enable the non-SSL port (6379) - disabled by default."
}

variable "minimum_tls_version" {
  description = "The minimum TLS version. Defaults to 1.0."
}

variable "private_static_ip_address" {
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. Defaults to true."
}

variable "redis_version" {
  description = "Redis version. Only major version needed. Valid values: 4, 6."
}

variable "replicas_per_master" {
  description = "Amount of replicas to create per master for this Redis Cache."
}

variable "replicas_per_primary" {
  description = "Amount of replicas to create per primary for this Redis Cache. If both replicas_per_primary and replicas_per_master are set, they need to be equal."
}

variable "tenant_settings" {
  description = "A mapping of tenant settings to assign to the resource."
}

variable "shard_count" {
  description = "Only available when using the Premium SKU The number of Shards to create on the Redis Cluster."
}

variable "subnet_id" {
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Redis Cache should be located. Changing this forces a new Redis Cache to be created."
}

variable "aof_backup_enabled" {
  description = "Enable or disable AOF persistence for this Redis Cache"
}

variable "aof_storage_connection_string_0" {
  description = "First Storage Account connection string for AOF persistence."
}

variable "aof_storage_connection_string_1" {
  description = "Second Storage Account connection string for AOF persistence."
}

variable "enable_authentication" {
  description = "If set to false, the Redis instance will be accessible without authentication. Defaults to true."
}

variable "maxmemory_reserved" {
  description = "Value in megabytes reserved for non-cache usage e.g. failover. Defaults are shown below."
}

variable "maxmemory_delta" {
  description = "The max-memory delta for this Redis instance. Defaults are shown below."
}

variable "maxmemory_policy" {
  description = "How Redis will select what to remove when maxmemory is reached. Defaults are shown below."
}

variable "maxfragmentationmemory_reserved" {
  description = "Value in megabytes reserved to accommodate for memory fragmentation. Defaults are shown below."
}

variable "rdb_backup_enabled" {
  description = "Is Backup Enabled? Only supported on Premium SKUs."
}

variable "rdb_backup_frequency" {
  description = "The Backup Frequency in Minutes. Only supported on Premium SKUs. Possible values are: 15, 30, 60, 360, 720 and 1440."
}

variable "rdb_backup_max_snapshot_count" {
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKUs."
}

variable "rdb_storage_connection_string" {
  description = "The Connection String to the Storage Account. Only supported for Premium SKUs"
}

variable "notify_keyspace_events" {
  description = "Keyspace notifications allows clients to subscribe to Pub/Sub channels in order to receive events affecting the Redis data set in some way. Reference"
}

variable "day_of_week" {
  description = "the Weekday name - possible values include Monday, Tuesday, Wednesday etc."
}

variable "start_hour_utc" {
  description = "the Start Hour for maintenance in UTC - possible values range from 0 - 23."
}

variable "maintenance_window" {
  description = "The ISO 8601 timespan which specifies the amount of time the Redis Cache can be updated. Defaults to PT5H."
}