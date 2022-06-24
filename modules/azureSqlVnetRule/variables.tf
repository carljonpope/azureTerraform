variable "name" {
  description = "The name of the SQL virtual network rule. Changing this forces a new resource to be created."
}

variable "server_id" {
  description = "The resource ID of the SQL Server to which this SQL virtual network rule will be applied. Changing this forces a new resource to be created."  
}

variable "subnet_id" {
  description = "The ID of the subnet from which the SQL server will accept communications."  
}

variable "ignore_missing_vnet_service_endpoint" {
  description = "Create the virtual network rule before the subnet has the virtual network service endpoint enabled. Defaults to false."  
}
