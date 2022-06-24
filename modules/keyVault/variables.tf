variable "name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unqiue. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
}

variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault? Defaults to false."
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Key Vault."
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
}

variable "default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable "ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
}

variable "virtual_network_subnet_ids" {
  description = "One or more Subnet IDs which should be able to access this Key Vault."
}