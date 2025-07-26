module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  environment         = var.environment
  client_id           = var.client_id
  client_secret       = var.client_secret
}