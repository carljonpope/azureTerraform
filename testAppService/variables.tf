variable "environment_tag" {
  type = string
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "settings" {
  type = object({
    global_environment_tag = string,
    environment = string,
    region = string,
    vnet_name = string,
    global_nsg = string,
    app_name = string,
    resource_group = string,
    global_resource_group = string,
    app_plan = object({
      name= string,
      kind= string,
      reserved = bool,
      sku = object({
        app_service_tier= string,
        app_service_size= string,
        resource_group = string
      })
    }),
    linked_resourcenames = list(string),
    resource_default_ip_restrictions= list(string),
    create_keyvault = bool,
    keyvault_config = object({
      name = string,
      sku_name = string
    }),
    subnet = object({
      name = string,
      address_prefix = string,
      service_endpoints = list(string)
    }),
    create_storage_account = optional(bool),
    storage_account = optional(object({
        name = optional(string),
        account_tier = optional(string),
        min_tls_version = optional(string),
        allow_blob_public_access = optional(bool),
        enable_https_traffic_only  = optional(bool),
        account_kind = optional(string),
        replication_type = optional(string),
        access_tier = optional(string)
    })),
    subnet = object({
      name = string,
      address_prefix = string,
      service_endpoints = list(string)
    })
  })
}

