# module "aks-production" {
#     source              = "./modules/aks"
#     resource_group_name = var.resource_group_name
#     location            = var.location
#     cluster_name         = "${var.cluster_name}-production"
#     environment          = "production"

#     client_id     = var.client_id
#     client_secret = var.client_secret
  
# }