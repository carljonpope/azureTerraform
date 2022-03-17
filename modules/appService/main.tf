resource "azurerm_app_service" "example" {
  name                = var.asName
  location            = var.asLocation
  resource_group_name = var.rgName
  app_service_plan_id = var.aspId

  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
    #dotnet_framework_version = "v3.1"
    }


}