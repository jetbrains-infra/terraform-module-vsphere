variable "datacenter" {
  type = "string"
}

variable "datastore" {
  type = "string"
}

variable "network" {
  type = "string"
}

variable "resource_pool" {
  type = "string"
}

variable "host" {
  type = "string"
}

variable "template_name" {
  type = "string"
}

variable "instance_count" {
  type = "number"
  default = 1
}

variable "name" {
  type = "string"
}

variable "annotation" {
  default = "Created with https://github.com/rvadim/terraform-module-vsphere"
}

variable "cpu" {
  type = "number"
  default = 1
}

variable "memory" {
  # Memory in Mb
  type = "number"
  default = 1024
}

variable "domain" {
  type = "string"
}

variable "folder" {
  type = "string"
}

variable "disk_label" {
  default = "disk0"
}
