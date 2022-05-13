variable "name" {
  description = "Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the namespace."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku" {
  description = "Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource."
}

variable "capacity" {
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
}

variable "local_auth_enabled" {
  description = "Whether or not SAS authentication is enabled for the Service Bus namespace. Defaults to true."
}

variable "zone_redundant" {
  description = "Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this ServiceBus Namespace. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this API Management Service."
}