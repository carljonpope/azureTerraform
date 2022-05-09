variable "resource_group_name" {
    description = "Specifies the resource group where the resource exists. Changing this forces a new resource to be created."
}

variable "name" {
        description = "The name of the Private DNS Zone. Must be a valid domain name."
}

variable "tags" {
    description = "A mapping of tags which should be assigned to the DNS Zone"
}