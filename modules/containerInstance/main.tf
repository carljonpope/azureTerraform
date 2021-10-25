resource "azurerm_container_group" "example" {
  name                = "example-continst"
  location            = "uksouth"
  resource_group_name = "compute"
  ip_address_type     = "public"
  dns_name_label      = "cjpcontainertest01"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld"#"microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  /*container {
    name   = "sidecar"
    image  = "mcr.microsoft.com/azuredocs/aci-tutorial-sidecar"
    cpu    = "0.5"
    memory = "1.5"
  }
  */

  tags = {
    environment = "testing"
  }
}