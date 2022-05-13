variable "name" {
  description = "Specifies the name of the ServiceBus Subscription resource. Changing this forces a new resource to be created."
}

variable "topic_id" {
  description = "The ID of the ServiceBus Topic to create this Subscription in. Changing this forces a new resource to be created."
}

variable "max_delivery_count" {
  description = "The maximum number of deliveries."
}

variable "auto_delete_on_idle" {
  description = "The idle interval after which the topic is automatically deleted as an ISO 8601 duration. The minimum duration is 5 minutes or PT5M."
}

variable "default_message_ttl" {
  description = "The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself."
}

variable "lock_duration" {
  description = "The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or P0DT0H1M0S . The maximum value is 5 minutes or P0DT0H5M0S ."
}

variable "dead_lettering_on_message_expiration" {
  description = "Boolean flag which controls whether the Subscription has dead letter support when a message expires. Defaults to false."
}

variable "dead_lettering_on_filter_evaluation_error" {
  description = "Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true."
}

variable "enable_batched_operations" {
  description = "Boolean flag which controls whether the Subscription supports batched operations. Defaults to false."
}

variable "requires_session" {
  description = "Boolean flag which controls whether this Subscription supports the concept of a session. Defaults to false. Changing this forces a new resource to be created."
}

variable "forward_to" {
  description = "The name of a Queue or Topic to automatically forward messages to."
}

variable "forward_dead_lettered_messages_to" {
  description = "The name of a Queue or Topic to automatically forward Dead Letter messages to."
}

variable "status" {
  description = "The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active."
}