locals {
  common_tags = {
    "AlertsNotificationDL"      = "alerts@fundslibrary.com"
    "ApplicationName"           = "Fund Communication Solutions"
    "ApprovedDevelopmentBudget" = "100"
    "ArcherID"                  = "2172"
    "brcp:region"               = "uksouth"
    "cfa:application"           = "fcs"
    "cfa:classification"        = "npd"
    "cfa:internal_id"           = "8c14e3e8-e286-4c66-808a-4fdea66e1d09"
    "ChargeCode"                = "FCSUK-5677-710-01812-000-AZURE_MIGRATION"
    "Deployed By"               = "Azure Cloud Foundation Architecture"
    "CreatedDate"               = timestamp()
    "DevelopmentLead"           = "chris.lewis@fundslibrary.com"
    "ECALiason"                 = "BR-Cloud-Engagement@broadridge.com"
    "EstimatedCosts"            = "100"
    "FinancialAnalyst"          = "Pratika.Patel@broadridge.com"
    "Function"                  = "Azure Cloud Platform"
    "Location"                  = "uksouth"
    "Owner"                     = "chris.lewis@fundslibrary.com"
    "SDLCEnv"                   = "dev"
    "Segment"                   = "ics"
    "ShortName"                 = "fcs"
    "environment"               = "sbx"
  }

  # Can only add 15 tags to private DNS zone using Terraform, should be fixed in later provider version
  private_dns_zone_tags = {
    "AlertsNotificationDL"      = "alerts@fundslibrary.com"
    "ApplicationName"           = "Fund Communication Solutions"
    "cfa:application"           = "fcs"
    "cfa:classification"        = "npd"
    "cfa:internal_id"           = "8c14e3e8-e286-4c66-808a-4fdea66e1d09"
    "ChargeCode"                = "FCSUK-5677-710-01812-000-AZURE_MIGRATION"
    "Deployed By"               = "Azure Cloud Foundation Architecture"
    "CreatedDate"               = timestamp()
    "DevelopmentLead"           = "chris.lewis@fundslibrary.com"
    "Location"                  = "uksouth"
    "Owner"                     = "chris.lewis@fundslibrary.com"
    "SDLCEnv"                   = "dev"
    "Segment"                   = "ics"
    "ShortName"                 = "fcs"
    "environment"               = "sbx"
  }

# Local for app settings so that variable can be used for keyvault name
  clientconfig_as_app_settings = {
  "APPINSIGHTS_INSTRUMENTATIONKEY"                                              = "3f5e29ff-9e74-4353-82ee-ff531f981f2"
  "APPINSIGHTS_PROFILERFEATURE_VERSION"                                         = "1.0.0"
  "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"                                         = "1.0.0"
  "ApplicationInsightsAgent_EXTENSION_VERSION"                                  = "~2"
  "ASPNETCORE_ENVIRONMENT"                                                      = "Development"
  "DiagnosticServices_EXTENSION_VERSION"                                        = "~3"
  "DisableCache"                                                                = "true"
  "Initial__UseDeveloperExceptionPage"                                          = "false"
  "InstrumentationEngine_EXTENSION_VERSION"                                     = "disabled"
  "IsAuditEnabled"                                                              = "true"
  "MessageServiceBusConfiguration__AuditLogTopic"                               = "audit"
  "OIDC__Auth__Authority"                                                       = "https://dev-identity-wa01.azurewebsites.net/connect/authorize"
  "SnapshotDebugger_EXTENSION_VERSION"                                          = "disabled"
  "WEBSITE_DAAS_STORAGE_SASURI"                                                 = "https://devmappingsa01.blob.core.windows.net/memorydumps?sv=2015-04-05&ss=bqt&srt=co&sp=rwdl&st=2021-05-25T10%3A03%3A45.4640000Z&se=2031-05-25T10%3A03%3A45.4630000Z&spr=http,https&sig=RUZF3vDuyGH1b%2BiePRp7EbqCAt3zAPvk2zWtY4%2BzS%2FE%3D"
  "WEBSITE_RUN_FROM_PACKAGE"                                                    = "1"
  "XDT_MicrosoftApplicationInsights_BaseExtensions"                             = "disabled"
  "XDT_MicrosoftApplicationInsights_Mode"                                       = "recommended"
  "WEBSITE_HEALTHCHECK_MAXPINGFAILURES"                                         = "10"
  "InstrumentationKey"                                                          = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/AppSettings-InstrumentationKey/)"
  "MessageServiceBusConfiguration__MessageTopicConnectionStrings__Connection1"  = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/ConnectionStrings-AzureServiceBus/)"
  "OIDC__Auth__ClientId"                                                        = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/OIDC-Auth-ClientId/)"
  "OIDC__Auth__ClientSecret"                                                    = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/OAuth-OIDC-ClientSecret/)"
  "RedisConnectionStrings__0"                                                   = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.azure.net/secrets/ConnectionStrings-Redis/)"
  "WEBSITE_WEBDEPLOY_USE_SCM"                                                   = "false"
  }

}

module "resource_group" {
  source   = "../modules/resourceGroup"
  name     = "${var.prefix}-${var.env}-${var.content}-${var.location}-rg01"
  location = var.location
  tags     = merge(local.common_tags)
}

module "key_vault" {
  source                              = "../modules/keyVault"
  name                                = "${var.content}-${var.env}-kv01"
  location                            = var.location
  resource_group_name                 = module.resource_group.resource_group_name
  tenant_id                           = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization           = var.kv_enable_rbac_authorization
  enabled_for_deployment              = var.kv_enabled_for_deployment
  enabled_for_disk_encryption         = var.kv_enabled_for_disk_encryption
  enabled_for_template_deployment     = var.kv_enabled_for_template_deployment
  purge_protection_enabled            = var.kv_purge_protection_enabled
  soft_delete_retention_days          = var.kv_soft_delete_retention_days
  sku_name                            = var.kv_sku_name
  tags                                = merge(local.common_tags)

  bypass                              = var.kv_bypass
  default_action                      = var.kv_default_action
  ip_rules                            = var.kv_ip_rules
  virtual_network_subnet_ids          = var.kv_virtual_network_subnet_ids
  }
  
  # Provide keyvault access to app service
module "keyvault_access_policy1" {
  source                  = "../modules/keyVaultAccessPolicy"
  key_vault_id            = module.key_vault.key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = module.app_service.app_service_principal_id
  key_permissions         = var.kv_key_permissions
  secret_permissions      = var.kv_secret_permissions
  certificate_permissions = var.kv_certificate_permissions
}

  # Provide keyvault access to jenkins
module "keyvault_access_policy2" {
  source                  = "../modules/keyVaultAccessPolicy"
  key_vault_id            = module.key_vault.key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = "44894663-16d1-4bc6-96e9-d695d46847e0"
  key_permissions         = var.kv2_key_permissions
  secret_permissions      = var.kv2_secret_permissions
  certificate_permissions = var.kv2_certificate_permissions
}
/*
# Secret placeholders - do not enter secrets in code!!

module "key_vault_secret1" {
  source                              = "../modules/keyVaultSecret"
  name                                = "AppSettings-InstrumentationKey"
  value                               = var.kvs_value
  key_vault_id                        = module.key_vault.key_vault_id
  content_type                        = var.kvs_content_type
  tags                                = merge(local.common_tags)
  not_before_date                     = var.kvs_not_before_date
  expiration_date                     = var.kvs_expiration_date
}

module "key_vault_secret2" {
  source                              = "../modules/keyVaultSecret"
  name                                = "ConnectionStrings-AzureServiceBus"
  value                               = var.kvs_value
  key_vault_id                        = module.key_vault.key_vault_id
  content_type                        = var.kvs_content_type
  tags                                = merge(local.common_tags)
  not_before_date                     = var.kvs_not_before_date
  expiration_date                     = var.kvs_expiration_date
}

module "key_vault_secret3" {
  source                              = "../modules/keyVaultSecret"
  name                                = "OIDC-Auth-ClientId"
  value                               = var.kvs_value
  key_vault_id                        = module.key_vault.key_vault_id
  content_type                        = var.kvs_content_type
  tags                                = merge(local.common_tags)
  not_before_date                     = var.kvs_not_before_date
  expiration_date                     = var.kvs_expiration_date
}

module "key_vault_secret4" {
  source                              = "../modules/keyVaultSecret"
  name                                = "OAuth-OIDC-ClientSecret"
  value                               = var.kvs_value
  key_vault_id                        = module.key_vault.key_vault_id
  content_type                        = var.kvs_content_type
  tags                                = merge(local.common_tags)
  not_before_date                     = var.kvs_not_before_date
  expiration_date                     = var.kvs_expiration_date
}

module "key_vault_secret5" {
  source                              = "../modules/keyVaultSecret"
  name                                = "ConnectionStrings-Redis"
  value                               = var.kvs_value
  key_vault_id                        = module.key_vault.key_vault_id
  content_type                        = var.kvs_content_type
  tags                                = merge(local.common_tags)
  not_before_date                     = var.kvs_not_before_date
  expiration_date                     = var.kvs_expiration_date
}
*/

module "app_service_plan" {
  source              = "../modules/appServicePlan"
  name                = "${var.prefix}-${var.env}-shared-${var.location}-asp01"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  os_type             = "Linux"
  sku_name            = var.asp_sku_name
  tags                = merge(local.common_tags)
  }

module "app_service" {
    source                              = "../modules/appServiceLinux"
    name                                = "${var.prefix}-${var.env}-${var.content}-${var.location}-as01"
    location                            = var.location
    resource_group_name                 = module.resource_group.resource_group_name
    app_service_plan_id                 = module.app_service_plan.app_service_plan_id
    client_affinity_enabled             = var.as_client_affinity_enabled
    client_certificate_enabled          = var.as_client_certificate_enabled
    enabled                             = var.as_enabled
    https_only                          = var.as_https_only
    app_settings                        = merge(local.clientconfig_as_app_settings) #var.as_app_settings
    tags                                = merge(local.common_tags)
    auth_settings_enabled               = var.as_auth_settings_enabled
    connection_string_name              = var.as_connection_string_name
    connection_string_type              = var.as_connection_string_type
    connection_string_value             = "@Microsoft.KeyVault(SecretUri=https://${module.key_vault.key_vault_name}.vault.azure.net/secrets/ConnectionStrings-DataUser/7199bcfd08be4c)" #local.as_connection_string_value #var.as_connection_string_value
    identity_type                       = var.as_identity_type
    site_config_always_on               = var.as_site_config_always_on
    site_config_managed_pipeline_mode   = var.as_site_config_managed_pipeline_mode
    site_config_ftps_state              = var.as_site_config_ftps_state
    site_config_http2_enabled           = var.as_site_config_http2_enabled
    site_config_websockets_enabled      = var.as_site_config_websockets_enabled
    site_config_minimum_tls_version     = var.as_site_config_minimum_tls_version
    site_config_route_all_enabled       = var.as_site_config_route_all_enabled
    app_stack_dotnet_version            = var.as_app_stack_dotnet_version
    http_logs_retention_days            = var.as_http_logs_retention_days
    http_logs_retention_mb              = var.as_http_logs_retention_mb
    http_logs_request_tracing           = var.as_http_logs_request_tracing
    https_logs_detailed_error_messages  = var.as_https_logs_detailed_error_messages
    app_service_id                      = module.app_service.app_service_id
    vnet_integration_subnet_id          = var.as_vnet_integration_subnet_id
}

module "dns_privatezone" {
  source                  = "../modules/privateDnsZone"
  resource_group_name     = module.resource_group.resource_group_name
  name                    = var.dns_privatezone_name
  tags                    = merge(local.private_dns_zone_tags)
}

module "private_link_endpoint" {
  source                          = "../modules/privateLinkEndpoint"
  name                            = "${var.prefix}-${var.env}-${var.content}-${var.location}-ple01"
  location                        = var.location
  resource_group_name             = module.resource_group.resource_group_name
  subnet_id                       = var.ple_vnet_private_endpoint_subnet_id
  private_service_connection_name = "${var.prefix}-${var.env}-${var.content}-${var.location}-psc01"
  private_connection_resource_id  = module.app_service.app_service_id
  subresource_names               = var.ple_subresource_names
  is_manual_connection            = var.ple_is_manual_connection
  private_dns_zone_group          = var.ple_private_dns_zone_group
  private_dns_zone_ids            = [module.dns_privatezone.private_dns_zone_id]
  tags                            = merge(local.common_tags)
}

module "dns_privatezone_vnet_link" {
  source                  = "../modules/privateDnsZoneVnetLink"
  name                    = "${var.prefix}-${var.env}-${var.content}-${var.location}-dnslink01"
  resource_group_name     = module.resource_group.resource_group_name
  private_dns_zone_name   = module.dns_privatezone.private_dns_zone_name
  virtual_network_id      = var.dnslink_vnet_id
}
/*
module "servicebus_namespace" {
  source                  = "../modules/servicebusNamespace"
  name                    = "${var.prefix}-${var.env}-${var.content}-${var.location}-sb01"
  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  sku                     = var.sb_sku
  capacity                = var.sb_capacity
  local_auth_enabled      = var.sb_local_auth_enabled
  zone_redundant          = var.sb_zone_redundant
  tags                    = merge(local.common_tags)
  type                    = var.sb_type
  identity_ids            = var.sb_identity_ids
}

module "servicebus_queue" {
  source                                  = "../modules/servicebusQueue"
  name                                    = "${var.prefix}-${var.env}-${var.content}-${var.location}-sbqueue01"
  namespace_id                            = module.servicebus_namespace.servicebus_namespace_id
  lock_duration                           = var.sbq_lock_duration
  max_message_size_in_kilobytes           = var.sbq_max_message_size_in_kilobytes
  max_size_in_megabytes                   = var.sbq_max_size_in_megabytes
  requires_duplicate_detection            = var.sbq_requires_duplicate_detection
  requires_session                        = var.sbq_requires_session
  default_message_ttl                     = var.sbq_default_message_ttl
  dead_lettering_on_message_expiration    = var.sbq_dead_lettering_on_message_expiration
  duplicate_detection_history_time_window = var.sbq_duplicate_detection_history_time_window
  max_delivery_count                      = var.sbq_max_delivery_count
  status                                  = var.sbq_status
  enable_batched_operations               = var.sbq_enable_batched_operations
  auto_delete_on_idle                     = var.sbq_auto_delete_on_idle
  enable_partitioning                     = var.sbq_enable_partitioning
  servicebus_sku                          = var.sb_sku
}

module "servicebus_topic" {
  source                                  = "../modules/servicebusTopic"
  name                                    = "${var.prefix}-${var.env}-${var.content}-${var.location}-sbtopic01"
  namespace_id                            = module.servicebus_namespace.servicebus_namespace_id
  status                                  = var.sbt_status
  auto_delete_on_idle                     = var.sbt_auto_delete_on_idle
  default_message_ttl                     = var.sbt_default_message_ttl
  duplicate_detection_history_time_window = var.sbt_duplicate_detection_history_time_window
  enable_batched_operations               = var.sbt_enable_batched_operations
  enable_express                          = var.sbt_enable_express
  enable_partitioning                     = var.sbt_enable_partitioning
  max_message_size_in_kilobytes           = var.sbt_max_message_size_in_kilobytes
  max_size_in_megabytes                   = var.sbt_max_size_in_megabytes
  requires_duplicate_detection            = var.sbt_requires_duplicate_detection
  support_ordering                        = var.sbt_support_ordering
  servicebus_sku                          = var.sb_sku
}

module "servicebus_subscription" {
  source                                    = "../modules/servicebusSubscription"
  name                                      = "${var.prefix}-${var.env}-${var.content}-${var.location}-sbsub01"
  topic_id                                  = module.servicebus_topic.servicebus_topic_id
  max_delivery_count                        = var.sbs_max_delivery_count
  auto_delete_on_idle                       = var.sbs_auto_delete_on_idle
  default_message_ttl                       = var.sbs_default_message_ttl
  lock_duration                             = var.sbs_lock_duration
  dead_lettering_on_message_expiration      = var.sbs_dead_lettering_on_message_expiration
  dead_lettering_on_filter_evaluation_error = var.sbs_dead_lettering_on_filter_evaluation_error
  enable_batched_operations                 = var.sbs_enable_batched_operations
  requires_session                          = var.sbs_requires_session
  forward_to                                = var.sbs_forward_to
  forward_dead_lettered_messages_to         = var.sbs_forward_dead_lettered_messages_to
  status                                    = var.sbs_status
}

module "redis_cache" {
  source                                    = "../modules/redisCache"
  name                                      = "${var.prefix}-${var.env}-${var.content}-${var.location}-rc01"
  resource_group_name                       = module.resource_group.resource_group_name
  location                                  = var.location
  capacity                                  = var.rc_capacity
  family                                    = var.rc_family
  sku_name                                  = var.rc_sku_name
  enable_non_ssl_port                       = var.rc_enable_non_ssl_port
  minimum_tls_version                       = var.rc_minimum_tls_version
  private_static_ip_address                 = var.rc_private_static_ip_address
  public_network_access_enabled             = var.rc_public_network_access_enabled
  redis_version                             = var.rc_redis_version
  replicas_per_master                       = var.rc_replicas_per_master
  replicas_per_primary                      = var.rc_replicas_per_primary
  tenant_settings                           = var.rc_tenant_settings
  shard_count                               = var.rc_shard_count
  subnet_id                                 = var.rc_subnet_id
  tags                                      = merge(local.common_tags)
  zones                                     = var.rc_zones
  aof_backup_enabled                        = var.rc_aof_backup_enabled
  aof_storage_connection_string_0           = var.rc_aof_storage_connection_string_0
  aof_storage_connection_string_1           = var.rc_aof_storage_connection_string_1
  enable_authentication                     = var.rc_enable_authentication
  maxmemory_reserved                        = var.rc_maxmemory_reserved
  maxmemory_delta                           = var.rc_maxmemory_delta
  maxmemory_policy                          = var.rc_maxmemory_policy
  maxfragmentationmemory_reserved           = var.rc_maxfragmentationmemory_reserved
  rdb_backup_enabled                        = var.rc_rdb_backup_enabled
  rdb_backup_frequency                      = var.rc_rdb_backup_frequency
  rdb_backup_max_snapshot_count             = var.rc_rdb_backup_max_snapshot_count
  rdb_storage_connection_string             = var.rc_rdb_storage_connection_string
  notify_keyspace_events                    = var.rc_notify_keyspace_events
  day_of_week                               = var.rc_day_of_week
  start_hour_utc                            = var.rc_start_hour_utc
  maintenance_window                        = var.rc_maintenance_window
}



module "mssqlserver" {
  source                               = "../modules/azureSqlServer"
  name                                 = lower("${var.prefix}-${var.env}-${var.content}-${var.location}-sqls01")
  resource_group_name                  = module.resource_group.resource_group_name
  location                             = var.location
  tags                                 = merge(local.common_tags)
  sql_version                          = var.ss_sql_version
  administrator_login                  = var.ss_administrator_login
  administrator_login_password         = data.azurerm_key_vault_secret.clientConfigSql.value
  connection_policy                    = var.ss_connection_policy
  minimum_tls_version                  = var.ss_minimum_tls_version
  public_network_access_enabled        = var.ss_public_network_access_enabled
  outbound_network_restriction_enabled = var.ss_outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = var.ss_primary_user_assigned_identity_id
  login_username                       = var.ss_login_username
  object_id                            = var.ss_object_id
  tenant_id                            = var.ss_tenant_id
  azuread_authentication_only          = var.ss_azuread_authentication_only
  type                                 = var.ss_type
  identity_ids                         = var.ss_identity_ids
}

module "mssql_vnet_rule" {
  source                                = "../modules/azureSqlVnetRule"
  name                                  = "${module.mssqlserver.mssql_server_name}-rule01"
  server_id                             = module.mssqlserver.mssql_server_id
  subnet_id                             = var.ss_subnet_id
  ignore_missing_vnet_service_endpoint  = var.ss_ignore_missing_vnet_service_endpoint
}

module "mssqldatabase" {
  source                                        = "../modules/azureSqlDatabase"
  name                                          = "${var.prefix}-${var.env}-${var.content}-${var.location}-sqldb01"
  tags                                          = merge(local.common_tags)
  server_id                                     = module.mssqlserver.mssql_server_id
  auto_pause_delay_in_minutes                   = var.db_auto_pause_delay_in_minutes
  create_mode                                   = var.db_create_mode
  creation_source_database_id                   = var.db_creation_source_database_id
  collation                                     = var.db_collation
  elastic_pool_id                               = var.db_elastic_pool_id
  geo_backup_enabled                            = var.db_geo_backup_enabled
  ledger_enabled                                = var.db_ledger_enabled
  license_type                                  = var.db_license_type
  max_size_gb                                   = var.db_max_size_gb
  min_capacity                                  = var.db_min_capacity
  restore_point_in_time                         = var.db_restore_point_in_time
  recover_database_id                           = var.db_recover_database_id
  restore_dropped_database_id                   = var.db_restore_dropped_database_id
  read_replica_count                            = var.db_read_replica_count
  read_scale                                    = var.db_read_scale
  sample_name                                   = var.db_sample_name
  sku_name                                      = var.db_sku_name
  storage_account_type                          = var.db_storage_account_type
  transparent_data_encryption_enabled           = var.db_transparent_data_encryption_enabled
  zone_redundant                                = var.db_zone_redundant
  audit_storage_account_access_key              = var.db_audit_storage_account_access_key
  audit_storage_endpoint                        = var.db_audit_storage_endpoint
  audit_storage_account_access_key_is_secondary = var.db_audit_storage_account_access_key_is_secondary
  audit_retention_in_days                       = var.db_audit_retention_in_days
  audit_log_monitoring_enabled                  = var.db_audit_log_monitoring_enabled
  lt_weekly_retention                           = var.db_lt_weekly_retention
  lt_monthly_retention                          = var.db_lt_monthly_retention
  lt_yearly_retention                           = var.db_lt_yearly_retention
  lt_week_of_year                               = var.db_lt_week_of_year
  st_retention_days                             = var.db_st_retention_days
  st_backup_interval_in_hours                   = var.db_st_backup_interval_in_hours
  td_state                                      = var.db_td_state
  td_disabled_alerts                            = var.db_td_disabled_alerts
  td_email_account_admins                       = var.db_td_email_account_admins
  td_email_addresses                            = var.db_td_email_addresses
  td_retention_days                             = var.db_td_retention_days
  td_storage_account_access_key                 = var.db_td_storage_account_access_key
  td_storage_endpoint                           = var.db_td_storage_endpoint
}

module "sql_auditing" {
  source                                  = "../modules/azureSqlAuditing"
  extended_auditing_enabled               = var.sau_extended_auditing_enabled
  server_id                               = module.mssqlserver.mssql_server_id
  storage_endpoint                        = var.sau_storage_endpoint
  storage_account_access_key              = var.sau_storage_account_access_key
  storage_account_access_key_is_secondary = var.sau_storage_account_access_key_is_secondary
  retention_in_days                       = var.sau_retention_in_days
  log_monitoring_enabled                  = var.sau_log_monitoring_enabled
  storage_account_subscription_id         = var.sau_storage_account_subscription_id

  target_resource_id                      = "${module.mssqlserver.mssql_server_id}/databases/master"
  eventhub_authorization_rule_id          = var.sau_eventhub_authorization_rule_id
  eventhub_name                           = var.sau_eventhub_name                  #"test"

  audit_scope                             = var.sau_audit_scope
  audit_role_definition_name              = var.sau_audit_role_definition_name
  audit_principal_id                      = module.mssqlserver.mssql_server_princiapl_id

  depends_on = [
    module.mssqldatabase
  ]
}

resource "null_resource" "sql_users" {
    provisioner "local-exec" {
    command = "sqlcmd -U ${var.ss_administrator_login} -P ${data.azurerm_key_vault_secret.clientConfigSql.value} -S ${br-az-ics-fcs-sbx-clientconfig-uksouth-sqls01.database.windows.net} -d ${br-az-ics-fcs-sbx-clientconfig-uksouth-sqldb01} -i ${init.sql}"
  }
}
*/