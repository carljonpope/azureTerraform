resource "azurerm_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resourcegroupname
  os_type             = var.os_type
  sku_name            = var.sku_name


}


output "aspIdOutput" {
      value = azurerm_app_service_plan.example.id
    }


  /*sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
  */