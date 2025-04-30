variable "location" {
  description = "Azure location"
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource Group name"
  default     = "student-rg"
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_address_prefix" {
  description = "Subnet address for web subnet"
  default     = ["10.0.1.0/24"]
}

variable "db_subnet_address_prefix" {
  description = "Subnet address for database subnet"
  default     = ["10.0.2.0/24"]
}
