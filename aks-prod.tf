# module "aks-staging" {
#     source              = "./modules/aks"
#     resource_group_name = var.resource_group_name
#     location            = var.location
#     cluster_name         = "${var.cluster_name}-staging"
#     environment          = "staging"
    
#     client_id     = var.client_id
#     client_secret = var.client_secret
  
# }