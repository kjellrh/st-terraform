variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "public_ip" {
  type    = bool
  default = false
}

variable "availability_set_id" {
  type    = string
  default = null
}
