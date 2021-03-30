variable "datacenter" {
  type = string
}

variable "host" {
  type = string
}

variable "resource_pool" {
  type = string
}

variable "datastore" {
  type = string
}

variable "network" {
  type = string
}

variable "folder" {
  type = string
}

variable "name" {
  type = string
}

variable "template_name" {
  type = string
}

variable "cpu" {
  type = string
  default = 1
}

variable "memory" {
  # Memory in Mb
  type = string
  default = 1024
}

variable "domain" {
  type = string
}

variable "instances_count" {
  type = string
  default = 1
}

variable "disk_size_gb" {
  type = string
  # 0 (zero) means same size as at template
  default = 0
}

variable "annotation" {
  default = "Created with https://github.com/jetbrains-infra/terraform-module-vsphere"
}

variable "disk_label" {
  default = "disk0"
}

variable "nested_hv_enabled" {
  default = false
}

variable "firmware" {
  default = "bios"
}

variable "mac_address" {
  default = null
}
variable "ipv4_address" {
  default = null
}
variable "ipv4_netmask" {
  default = null
}
variable "ipv4_gateway" {
  default = null
}
