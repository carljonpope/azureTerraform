variable "location" {
  description = "The Azure region in which resources should be deployed."
  default = "uksouth"
}

variable "number_of_rg" {
  default = 2
}

variable "tags" {
  default = {
    test = "test1"
  }
}

variable "name" {
  default = "rg0"
}