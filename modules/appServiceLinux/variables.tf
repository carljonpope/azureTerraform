variable "name" {
    description = "The name which should be used for this Linux Web App. Changing this forces a new Linux Web App to be created."
}

variable "location" {
    description = "The Azure Region where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
}

variable "resource_group_name" {
    description = "The name of the Resource Group where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
}

variable "app_service_plan_id" {
    description = "The ID of the Service Plan that this Linux App Service will be created in."
}

variable "client_affinity_enabled" {
    description = "Should Client Affinity be enabled?"
}

variable "client_certificate_enabled" {
    description = "Should Client Certificates be enabled?"
}

variable "enabled" {
    description = "Should the Linux Web App be enabled? Defaults to true."
}

variable "https_only" {
    description = "Should the Linux Web App require HTTPS connections."
}

variable "app_settings" {
    description = "A map of key-value pairs of App Settings."
}

variable "auth_settings_enabled" {
    description = "Should the Authentication / Authorization feature be enabled for the Linux Web App?"
}

variable "connection_string_name" {
    description = "The name of the Connection String."
}

variable "connection_string_type" {
    description = "Type of database. Possible values include: MySQL, SQLServer, SQLAzure, Custom, NotificationHub, ServiceBus, EventHub, APIHub, DocDb, RedisCache, and PostgreSQL."
}

variable "connection_string_value" {
    description = "The connection string value."
}

variable "identity_type" {
    description = "Specifies the type of Managed Service Identity that should be configured on this Linux Web App. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "tags" {
    description = "A mapping of tags which should be assigned to the Linux Web App."
}

variable "http_logs_retention_days" {
    description = "The retention period in days. A value of 0 means no retention."
}

variable "http_logs_retention_mb" {
    description = "The maximum size in megabytes that log files can use."
}

variable "http_logs_request_tracing" {
    description = "Should failed request tracing be enabled."
}

variable "https_logs_detailed_error_messages" {
      description = "Should detailed error messages be enabled."
}

variable "site_config_always_on" {
    description = "If this Linux Web App is Always On enabled. Defaults to false."
}

variable "app_stack_dotnet_version" {
    description = "The version of .Net to use. Possible values include 3.1, 5.0, and 6.0."
}

variable "site_config_managed_pipeline_mode" {
    description = "Managed pipeline mode. Possible values include: Integrated, Classic."
}

variable "site_config_ftps_state" {
    description = "The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled."
}

variable "site_config_http2_enabled" {
    description = "Should HTTP2 be enabled?"
}

variable "site_config_websockets_enabled" {
    description = "Should Web Sockets be enabled. Defaults to false."
}

variable "site_config_minimum_tls_version" {
    description = "The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2."
}

variable "site_config_route_all_enabled" {
    description = "Should all outbound traffic have Virtual Network Security Groups and User Defined Routes applied?"
}

# VNet Integration

variable "app_service_id" {
    description = "The ID of the App Service or Function App to associate to the VNet. Changing this forces a new resource to be created."
}

variable "subnet_id" {
    description = "The ID of the subnet the app service will be associated to (the subnet must have a service_delegation configured for Microsoft.Web/serverFarms)."
}