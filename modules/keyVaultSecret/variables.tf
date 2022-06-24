variable "name" {
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."  
}

variable "value" {
  description = "Specifies the value of the Key Vault Secret."  
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the Secret should be created."  
}

variable "content_type" {
  description = "Specifies the content type for the Key Vault Secret."  
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."  
}

variable "not_before_date" {
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."  
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."  
}