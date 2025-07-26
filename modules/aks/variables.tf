variable "cluster_name" {
  type        = string
  description = "The name of the kubernetes cluster"
}

variable "location" {
  type        = string
  description = "Resource Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "environment" {
  type        = string
  description = "Resource Environment"
}

variable "client_id" {
  type        = string
  description = "Service Principal Client ID"
}

variable "client_secret" {
  type        = string
  description = "Service Principal Client Secret"
  sensitive   = true
}
