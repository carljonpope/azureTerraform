variable "name" {
    description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
}

variable "location" {
    description = "The supported Azure location where the resource exists. Changing this forces a new resource to be created.."
}

variable "resource_group_name" {
    description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
}

variable "subnet_id" {
    description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
}

variable "private_service_connection_name" {
    description = "Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created."
}

variable "private_connection_resource_id" {
    description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
}

variable "subresource_names" {
    description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created."
}

variable "is_manual_connection" {
    description = "Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
}

variable "private_dns_zone_group" {
    description = "Specifies the Name of the Private DNS Zone Group. Changing this forces a new private_dns_zone_group resource to be created."
}

variable "private_dns_zone_ids" {
    description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "tags" {
    description = "A mapping of tags which should be assigned to the private link endpoint"
}