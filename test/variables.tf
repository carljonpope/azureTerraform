variable "prefix" {
  default     = "br-az-ics-fcs"
  description = "Resource name prefix."
}

variable "location" {
  description = "The Azure region in which resources should be deployed."
}

variable "env" {
  description = "The environment in which the resource will be deployed"
}