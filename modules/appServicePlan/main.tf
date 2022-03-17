resource "azurerm_app_service_plan" "example" {
  name                = var.aspName
  location            = var.aspLocation
  resource_group_name = var.rgName
  kind                = "Linux"
  reserved            = true


  sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
}


output "aspIdOutput" {
      value = azurerm_app_service_plan.example.id
    }