variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {}
variable "backend_pool_vm_nics" {
  type = list(string)
}

