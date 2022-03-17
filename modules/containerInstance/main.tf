resource "azurerm_container_group" "example" {
  name                = "example-continst"
  location            = "uksouth"
  resource_group_name = "compute"
  ip_address_type     = "public"
  dns_name_label      = "cjpcontainertest01"
  os_type             = "Linux"

  container {
    name   = "csharpjenkins"
    image  = "jenkins/jenkins:lts"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    ports {
      port     = 8080
      protocol = "TCP"
    }

    ports {
      port     = 50000
      protocol = "TCP"
    }    
    
  }
  tags = {
    environment = "testing"
  }
}