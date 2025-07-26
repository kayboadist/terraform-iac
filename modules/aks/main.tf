resource "azurerm_kubernetes_cluster" "kays-cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "kaysaks1"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "00000000-0000-0000-0000-00000000"
    client_secret = "00000000000000000000000000000000"
  }

  tags = {
    Environment = var.environment
  }
}

