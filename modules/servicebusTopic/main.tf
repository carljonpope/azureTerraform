resource "azurerm_servicebus_topic" "servicebus_topic" {
  name                                      = var.name
  namespace_id                              = var.namespace_id
  status                                    = var.status
  auto_delete_on_idle                       = var.auto_delete_on_idle
  default_message_ttl                       = var.default_message_ttl
  duplicate_detection_history_time_window   = var.duplicate_detection_history_time_window
  enable_batched_operations                 = var.enable_batched_operations
  enable_express                            = var.enable_express
  enable_partitioning                       = var.enable_partitioning
  max_message_size_in_kilobytes             = var.servicebus_sku == "premium" ? var.max_message_size_in_kilobytes : null
  max_size_in_megabytes                     = var.max_size_in_megabytes
  requires_duplicate_detection              = var.requires_duplicate_detection
  support_ordering                          = var.support_ordering
}