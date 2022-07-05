resource "azurerm_application_insights" "application_insights" {
  name                                  = var.name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  application_type                      = var.application_type
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  sampling_percentage                   = var.sampling_percentage
  retention_in_days                     = var.retention_in_days
  disable_ip_masking                    = var.disable_ip_masking
  tags                                  = var.tags
}
