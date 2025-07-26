variable "cluster_name" {
  type        = string
  description = "The name of the kubernetes cluster"
}

variable "environment" {
  type        = string
  description = "Resource Environment"
}

variable "location" {
  type        = string
  description = "Resource Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}
