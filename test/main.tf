terraform {

  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#module "vnet1" {
#    source = "../modules/vnet"
#}

resource "azurerm_virtual_network" "example" {
  name                = "virtualNetworkTest"
  location            = var.resourceLocation
  resource_group_name = "networking"
  address_space       = ["10.1.0.0/16"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.1.1.0/24"
  }

  tags = {
    environment = "Test"
  }
}