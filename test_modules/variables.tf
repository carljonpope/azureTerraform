variable "rule_map" {
  default = {rule1 = "subnet1", rule2 = "subnet2"}
}

variable "rule_subnet" {
  #type = list
  default = "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1" # "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet2"]
}

