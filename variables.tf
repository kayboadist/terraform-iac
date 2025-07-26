variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "kaysfirst-rg"
}

variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = "Central US"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "kaysfirst-vm"
}

variable "environment" {
  description = "The environment tag for the resources"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "kubernetes cluster name"
  type        = string
  default     = "kaysfirst-aks"
}

variable "client_id" {
  type        = string
  description = "Client ID for the service principal"
}

variable "client_secret" {
  type        = string
  description = "Client Secret for the service principal"
  sensitive   = true
}