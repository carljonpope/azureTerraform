data "azurerm_resource_group" "webapps" {
  name = "webapps"
}

data "azurerm_app_service_plan" "cjptest-asp01" {
  resource_group_name = data.azurerm_resource_group.webapps.name
  name                = "cjptest-asp01"
}

resource "azurerm_app_service" "cjptest-as04" {
  name                = "cjptest-as04"
  location            = "uksouth"
  resource_group_name = data.azurerm_resource_group.webapps.name
  app_service_plan_id = data.azurerm_app_service_plan.cjptest-asp01.id

  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
    #dotnet_framework_version = "v3.1"
  }


}