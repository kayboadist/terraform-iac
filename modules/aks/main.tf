resource "azurerm_kubernetes_cluster" "kays-cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "kaysaks1"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
    
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}
