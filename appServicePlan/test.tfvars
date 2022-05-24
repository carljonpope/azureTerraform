location     = "swedencentral"
asp_sku_name = "B1"
content      = "clientConfig"
tags = {
  environment = "dev"
}

# Autoscale setting

capacity_default = "1"
capacity_minimum = "1"
capacity_maximum = "3"

scale_out_metric_name      = "CpuPercentage"
scale_out_time_grain       = "PT1M"
scale_out_statistic        = "Average"
scale_out_time_window      = "PT5M"
scale_out_time_aggregation = "Average"
scale_out_operator         = "GreaterThan"
scale_out_threshold        = 80

scale_in_metric_name      = "CpuPercentage"
scale_in_time_grain       = "PT1M"
scale_in_statistic        = "Average"
scale_in_time_window      = "PT5M"
scale_in_time_aggregation = "Average"
scale_in_operator         = "LessThan"
scale_in_threshold        = 60


# App Service

as_client_affinity_enabled            = "true"
as_client_certificate_enabled         = "false"
as_enabled                            = "true"
as_https_only                         = "true"
as_connection_string_name             = "ClientConfiguration"
as_connection_string_type             = "SQLServer"
as_connection_string_value            = "@Microsoft.KeyVault(SecretUri=https://dev-clientconfig-kv01.vault.azure.net/secrets/ConnectionStrings-DataUser/7199bcfd08be4c1f8700a8b69cf6785)"
as_identity_type                      = "SystemAssigned"
as_auth_settings_enabled              = "false"
as_site_config_always_on              = "true"
as_site_config_managed_pipeline_mode  = "Integrated"
as_site_config_ftps_state             = "Disabled"
as_site_config_http2_enabled          = "true"
as_site_config_websockets_enabled     = "false"
as_site_config_minimum_tls_version    = "1.2"
as_site_config_route_all_enabled      = "true"
as_app_stack_dotnet_version           = "3.1"
as_http_logs_retention_days           = "365"
as_http_logs_retention_mb             = "35"
as_http_logs_request_tracing          = "true"
as_https_logs_detailed_error_messages = "true"
as_vnet_integration_subnet_id         = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet2"

as_app_settings = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "3f5e29ff-9e74-4353-82ee-ff531f981f2"
}

# Diagnostic settings

diag_eventhub_name                           = "cjptest-eh01"
diag_eventhub_authorization_rule_id          = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/storage/providers/Microsoft.EventHub/namespaces/cjptest-eh01/authorizationRules/RootManageSharedAccessKey"
diag_storage_account_id                      = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Storage/storageAccounts/cjptest02"
diag_app_service_console_logs_enabled        = "true"
diag_app_service_console_logs_retention      = "365"
diag_app_service_http_logs_enabled           = "true"
diag_app_service_http_logs_retention         = "365"
diag_app_service_audit_logs_enabled          = "true"
diag_app_service_audit_logs_retention        = "365"
diag_app_service_file_audit_logs_enabled     = "false"
diag_app_service_file_audit_logs_retention   = "365"
diag_app_service_app_logs_enabled            = "true"
diag_app_service_app_logs_retention          = "365"
diag_app_service_ipsec_audit_logs_enabled    = "true"
diag_app_service_ipsec_audit_logs_retention  = "365"
diag_app_service_platform_logs_enabled       = "true"
diag_app_service_platform_logs_retention     = "365"
diag_app_service_avscan_audit_logs_enabled   = "false"
diag_app_service_avscan_audit_logs_retention = "365"

# Key Vault

kv_enable_rbac_authorization       = "false"
kv_enabled_for_deployment          = "false"
kv_enabled_for_disk_encryption     = "false"
kv_enabled_for_template_deployment = "false"
kv_purge_protection_enabled        = "false"
kv_soft_delete_retention_days      = "90"
kv_sku_name                        = "standard"

# Key Vault Access Policy
kv_object_id = "9ea63675-1896-4d80-be7a-312bb3314682"
kv_key_permissions = [
  "Get",
  "List",
  "Update",
]
kv_secret_permissions = [
  "Get",
  "List",
]
kv_certificate_permissions = [
  "Get",
]
kv_object_id_2 = "d2ae3367-7f7d-42ce-a386-da8336b5e6ee"

# DNS Private Zone

dns_privatezone_name = "privatelink.azurewebsites.net"

# DNS Private Zone VNet Link

dnslink_vnet_id = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1"

# Private Link Endpoint

ple_subresource_names               = ["sites"]
ple_is_manual_connection            = "false"
ple_private_dns_zone_group          = "privatednszonegroup"
ple_vnet_private_endpoint_subnet_id = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet3"

# Servicebus Namespace

sb_sku                = "Standard"
sb_capacity           = 0
sb_local_auth_enabled = "true"
sb_zone_redundant     = "false"
sb_type               = "SystemAssigned"
sb_identity_ids       = []

# Servicebus Queue

sbq_lock_duration                           = "PT1M"
sbq_max_message_size_in_kilobytes           = 1024
sbq_max_size_in_megabytes                   = 1024
sbq_requires_duplicate_detection            = "false"
sbq_requires_session                        = "false"
sbq_default_message_ttl                     = null #"P10675199DT2H48M5.4S"
sbq_dead_lettering_on_message_expiration    = "false"
sbq_duplicate_detection_history_time_window = "PT10M"
sbq_max_delivery_count                      = 10
sbq_status                                  = "Active"
sbq_enable_batched_operations               = "true"
sbq_auto_delete_on_idle                     = null #"P10675199DT2H48M5.4S"
sbq_enable_partitioning                     = "false"

# Servicebus topic

sbt_status                                  = "Active"
sbt_auto_delete_on_idle                     = null
sbt_default_message_ttl                     = null
sbt_duplicate_detection_history_time_window = null
sbt_enable_batched_operations               = "true"
sbt_enable_express                          = null
sbt_enable_partitioning                     = "false"
sbt_max_message_size_in_kilobytes           = 4096
sbt_max_size_in_megabytes                   = 2048
sbt_requires_duplicate_detection            = "false"
sbt_support_ordering                        = "false"

# Servicebus subscription

sbs_max_delivery_count                        = 10
sbs_auto_delete_on_idle                       = null
sbs_default_message_ttl                       = null
sbs_lock_duration                             = null
sbs_dead_lettering_on_message_expiration      = null
sbs_dead_lettering_on_filter_evaluation_error = null
sbs_enable_batched_operations                 = null
sbs_requires_session                          = null
sbs_forward_to                                = null
sbs_forward_dead_lettered_messages_to         = null
sbs_status                                    = null

# Redis Cache

rc_capacity                        = "1"
rc_family                          = "C"
rc_sku_name                        = "Basic"
rc_enable_non_ssl_port             = null
rc_minimum_tls_version             = null
rc_private_static_ip_address       = null
rc_public_network_access_enabled   = null
rc_redis_version                   = null
rc_replicas_per_master             = null
rc_replicas_per_primary            = null
rc_tenant_settings                 = null
rc_shard_count                     = null
rc_subnet_id                       = null
rc_tags                            = null
rc_zones                           = null
rc_aof_backup_enabled              = null
rc_aof_storage_connection_string_0 = null
rc_aof_storage_connection_string_1 = null
rc_enable_authentication           = null
rc_maxmemory_reserved              = null
rc_maxmemory_delta                 = null
rc_maxmemory_policy                = null
rc_maxfragmentationmemory_reserved = null
rc_rdb_backup_enabled              = null
rc_rdb_backup_frequency            = null
rc_rdb_backup_max_snapshot_count   = null
rc_rdb_storage_connection_string   = null
rc_notify_keyspace_events          = null
rc_day_of_week                     = "Sunday"
rc_start_hour_utc                  = null
rc_maintenance_window              = null

# SQL Server

ss_sql_version                          = "12.0"
ss_administrator_login                  = "azuresqladmin"
ss_administrator_login_password         = "testpassword123$"
ss_connection_policy                    = null
ss_minimum_tls_version                  = null
ss_public_network_access_enabled        = null
ss_outbound_network_restriction_enabled = null
ss_primary_user_assigned_identity_id    = null
ss_login_username                       = "carljonpope"
ss_object_id                            = "9ea63675-1896-4d80-be7a-312bb3314682"
ss_tenant_id                            = null
ss_azuread_authentication_only          = null
ss_type                                 = "SystemAssigned"
ss_identity_ids                         = null

# SQL Database

db_auto_pause_delay_in_minutes                   = null
db_create_mode                                   = null
db_creation_source_database_id                   = null
db_collation                                     = null
db_elastic_pool_id                               = null
db_geo_backup_enabled                            = null
db_ledger_enabled                                = null
db_license_type                                  = null
db_max_size_gb                                   = null
db_min_capacity                                  = null
db_restore_point_in_time                         = null
db_recover_database_id                           = null
db_restore_dropped_database_id                   = null
db_read_replica_count                            = null
db_read_scale                                    = null
db_sample_name                                   = null
db_sku_name                                      = "S0"
db_storage_account_type                          = null
db_transparent_data_encryption_enabled           = null
db_zone_redundant                                = null
db_audit_storage_account_access_key              = null
db_audit_storage_endpoint                        = null
db_audit_storage_account_access_key_is_secondary = null
db_audit_retention_in_days                       = null
db_audit_log_monitoring_enabled                  = null
db_lt_weekly_retention                           = null
db_lt_monthly_retention                          = null
db_lt_yearly_retention                           = null
db_lt_week_of_year                               = "1"
db_st_retention_days                             = "30"
db_st_backup_interval_in_hours                   = "24"
db_td_state                                      = "Disabled"
db_td_disabled_alerts                            = null
db_td_email_account_admins                       = null
db_td_email_addresses                            = null
db_td_retention_days                             = null
db_td_storage_account_access_key                 = null
db_td_storage_endpoint                           = null

# SQL Auditing

sau_extended_auditing_enabled               = "true"
sau_storage_endpoint                        = "https://cjptest02.blob.core.windows.net"
sau_storage_account_access_key              = null
sau_storage_account_access_key_is_secondary = null #"false"
sau_retention_in_days                       = "365"
sau_log_monitoring_enabled                  = null
sau_storage_account_subscription_id         = null
sau_eventhub_authorization_rule_id          = null
sau_eventhub_name                           = "test"
sau_audit_scope                             = null
sau_audit_role_definition_name              = "Storage Blob Data Contributor"