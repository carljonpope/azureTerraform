location     = "uksouth"
content      = "clientConfig"
env          = "sbx"

# App Service Plan

asp_sku_name = "B1"

# App Service

as_client_affinity_enabled            = "true"
as_client_certificate_enabled         = "false"
as_enabled                            = "true"
as_https_only                         = "true"
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
as_vnet_integration_subnet_id         = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-sbx-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Network/virtualNetworks/br-az-ics-fcs-sbx-uksouth-vnet-01/subnets/br-az-ics-fcs-sbx-uksouth-vnet-01-private-snet-03"

as_connection_string_name             = "ClientConfiguration"
as_connection_string_type             = "SQLServer"
#as_connection_string_value            = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/ConnectionStrings-DataUser/7199bcfd08be4c)"
/*as_app_settings = {
  "APPINSIGHTS_INSTRUMENTATIONKEY"                                              = "3f5e29ff-9e74-4353-82ee-ff531f981f2"
  "APPINSIGHTS_PROFILERFEATURE_VERSION"                                         = "1.0.0"
  "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"                                         = "1.0.0"
  "ApplicationInsightsAgent_EXTENSION_VERSION"                                  = "~2"
  "ASPNETCORE_ENVIRONMENT"                                                      = "Development"
  "DiagnosticServices_EXTENSION_VERSION"                                        = "~3"
  "DisableCache"                                                                = "TRUE"
  "Initial__UseDeveloperExceptionPage"                                          = "FALSE"
  "InstrumentationEngine_EXTENSION_VERSION"                                     = "disabled"
  "IsAuditEnabled"                                                              = "TRUE"
  "MessageServiceBusConfiguration__AuditLogTopic"                               = "audit"
  "OIDC__Auth__Authority"                                                       = "https://dev-identity-wa01.azurewebsites.net/connect/authorize"
  "SnapshotDebugger_EXTENSION_VERSION"                                          = "disabled"
  "WEBSITE_DAAS_STORAGE_SASURI"                                                 = "https://devmappingsa01.blob.core.windows.net/memorydumps?sv=2015-04-05&ss=bqt&srt=co&sp=rwdl&st=2021-05-25T10%3A03%3A45.4640000Z&se=2031-05-25T10%3A03%3A45.4630000Z&spr=http,https&sig=RUZF3vDuyGH1b%2BiePRp7EbqCAt3zAPvk2zWtY4%2BzS%2FE%3D"
  "WEBSITE_RUN_FROM_PACKAGE"                                                    = "1"
  "XDT_MicrosoftApplicationInsights_BaseExtensions"                             = "disabled"
  "XDT_MicrosoftApplicationInsights_Mode"                                       = "recommended"
  "WEBSITE_HEALTHCHECK_MAXPINGFAILURES"                                         = "10"
  "InstrumentationKey"                                                          = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/AppSettings-InstrumentationKey/"
  "MessageServiceBusConfiguration__MessageTopicConnectionStrings__Connection1"  = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/ConnectionStrings-AzureServiceBus/)"
  "OIDC__Auth__ClientId"                                                        = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/OIDC-Auth-ClientId/)"
  "OIDC__Auth__ClientSecret"                                                    = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/OAuth-OIDC-ClientSecret/)"
  "RedisConnectionStrings__0"                                                   = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.azure.net/secrets/ConnectionStrings-Redis/)"
}
*/
# DNS Private Zone

dns_privatezone_name = "privatelink.azurewebsites.net"

# DNS Private Zone VNet Link

dnslink_vnet_id = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-sbx-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Network/virtualNetworks/br-az-ics-fcs-sbx-uksouth-vnet-01"

# Private Link Endpoint

ple_subresource_names               = ["sites"]
ple_is_manual_connection            = "false"
ple_private_dns_zone_group          = "privatednszonegroup"
ple_vnet_private_endpoint_subnet_id = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-sbx-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Network/virtualNetworks/br-az-ics-fcs-sbx-uksouth-vnet-01/subnets/br-az-ics-fcs-sbx-uksouth-vnet-01-private-snet-02"

# Key Vault

kv_enable_rbac_authorization       = "false"
kv_enabled_for_deployment          = "false"
kv_enabled_for_disk_encryption     = "false"
kv_enabled_for_template_deployment = "false"
kv_purge_protection_enabled        = "false"
kv_soft_delete_retention_days      = "90"
kv_sku_name                        = "standard"

kv_bypass                           = "AzureServices"
kv_default_action                   = "Deny"
kv_ip_rules                         = ["212.36.174.180/32", "165.225.220.152"]
kv_virtual_network_subnet_ids       = ["/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-sbx-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Network/virtualNetworks/br-az-ics-fcs-sbx-uksouth-vnet-01/subnets/br-az-ics-fcs-sbx-uksouth-vnet-01-private-snet-03"]

# Key Vault Access Policy

kv_key_permissions = [
]
kv_secret_permissions = [
  "Get",
]
kv_certificate_permissions = [
]

kv2_key_permissions = [
]
kv2_secret_permissions = [
  "Get", "List", "Set", "Delete"
]
kv2_certificate_permissions = [
]

# Key Vault  secrets

kvs_content_type     = null
kvs_not_before_date  = null
kvs_expiration_date  = null

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
sbq_default_message_ttl                     = null
sbq_dead_lettering_on_message_expiration    = "false"
sbq_duplicate_detection_history_time_window = "PT10M"
sbq_max_delivery_count                      = 10
sbq_status                                  = "Active"
sbq_enable_batched_operations               = "true"
sbq_auto_delete_on_idle                     = null
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
ss_administrator_login                  = "ClientConfigUser"
#ss_administrator_login_password         = data.azurerm_key_vault_secret.clientConfigSql.value
ss_connection_policy                    = null
ss_minimum_tls_version                  = null
ss_public_network_access_enabled        = null
ss_outbound_network_restriction_enabled = null
ss_primary_user_assigned_identity_id    = null
ss_login_username                       = "carl.pope@broadridge.com"
ss_object_id                            = "91ff804b-8b34-4e19-808d-caa4badfc3d6"
ss_tenant_id                            = null
ss_azuread_authentication_only          = false
ss_type                                 = "SystemAssigned"
ss_identity_ids                         = null

# SQL Server VNet Rule

ss_subnet_id                            = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-sbx-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Network/virtualNetworks/br-az-ics-fcs-sbx-uksouth-vnet-01/subnets/br-az-ics-fcs-sbx-uksouth-vnet-01-private-snet-03"
ss_ignore_missing_vnet_service_endpoint = false

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
sau_storage_endpoint                        = "https://adityaclinew.blob.core.windows.net"
sau_storage_account_access_key              = null
sau_storage_account_access_key_is_secondary = null
sau_retention_in_days                       = "365"
sau_log_monitoring_enabled                  = null
sau_storage_account_subscription_id         = null
sau_eventhub_authorization_rule_id          = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-dev-eh-rg/providers/Microsoft.EventHub/namespaces/br-az-ics-dev-eh-uksouth/authorizationRules/RootManageSharedAccessKey"
sau_eventhub_name                           = "sendlogstosplunk"
sau_audit_scope                             = "/subscriptions/c37f4fc5-593e-4791-a6e2-bf5436b0c97d/resourceGroups/br-az-ics-fcs-dev-ntwrk-vnet-uksouth-rg-01/providers/Microsoft.Storage/storageAccounts/adityaclinew" #null
sau_audit_role_definition_name              = "Storage Blob Data Contributor"