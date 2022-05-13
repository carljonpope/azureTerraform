variable "name" {
  description = "Specifies the name of the ServiceBus Topic resource. Changing this forces a new resource to be created."
}

variable "namespace_id" {
  description = "The ID of the ServiceBus Namespace to create this topic in. Changing this forces a new resource to be created."
}

variable "status" {
  description = "The Status of the Service Bus Topic. Acceptable values are Active or Disabled. Defaults to Active."
}

variable "auto_delete_on_idle" {
  description = "The ISO 8601 timespan duration of the idle interval after which the Topic is automatically deleted, minimum of 5 minutes."
}

variable "default_message_ttl" {
  description = "The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself."
}

variable "duplicate_detection_history_time_window" {
  description = "The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes. (PT10M)"
}

variable "enable_batched_operations" {
  description = "Boolean flag which controls if server-side batched operations are enabled. Defaults to false."
}

variable "enable_express" {
  description = "Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false."
}

variable "enable_partitioning" {
  description = "Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers. Defaults to false. Changing this forces a new resource to be created."
}

variable "max_message_size_in_kilobytes" {
  description = "Integer value which controls the maximum size of a message allowed on the topic for Premium SKU."
}

variable "max_size_in_megabytes" {
  description = "Integer value which controls the size of memory allocated for the topic."
}

variable "requires_duplicate_detection" {
  description = "Boolean flag which controls whether the Topic requires duplicate detection. Defaults to false. Changing this forces a new resource to be created."
}

variable "support_ordering" {
  description = "Boolean flag which controls whether the Topic supports ordering. Defaults to false."
}

variable "servicebus_sku" {
    description = "The Servicebus Namespae SKU."
}