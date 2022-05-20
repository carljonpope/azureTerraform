resource "azurerm_redis_cache" "redis_cache" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = var.minimum_tls_version
  private_static_ip_address     = var.private_static_ip_address
  public_network_access_enabled = var.public_network_access_enabled
  redis_version                 = var.redis_version
  replicas_per_master           = var.replicas_per_master
  replicas_per_primary          = var.replicas_per_primary
  tenant_settings               = var.tenant_settings
  shard_count                   = var.sku_name == "premium" ? var.shard_count : null
  subnet_id                     = var.sku_name == "premium" ? var.subnet_id : null
  tags                          = var.tags
  zones                         = var.zones

  redis_configuration {
    aof_backup_enabled              = var.aof_backup_enabled
    aof_storage_connection_string_0 = var.aof_storage_connection_string_0
    aof_storage_connection_string_1 = var.aof_storage_connection_string_1
    enable_authentication           = var.enable_authentication
    maxmemory_reserved              = var.maxmemory_reserved
    maxmemory_delta                 = var.maxmemory_delta
    maxmemory_policy                = var.maxmemory_policy
    maxfragmentationmemory_reserved = var.maxfragmentationmemory_reserved
    rdb_backup_enabled              = var.sku_name == "premium" ? var.rdb_backup_enabled : null
    rdb_backup_frequency            = var.sku_name == "premium" ? var.rdb_backup_frequency : null
    rdb_backup_max_snapshot_count   = var.sku_name == "premium" ? var.rdb_backup_max_snapshot_count : null
    rdb_storage_connection_string   = var.sku_name == "premium" ? var.rdb_storage_connection_string : null
    notify_keyspace_events          = var.notify_keyspace_events
  }

  patch_schedule {
    day_of_week         = var.day_of_week
    start_hour_utc      = var.start_hour_utc
    maintenance_window  = var.maintenance_window
  }
}