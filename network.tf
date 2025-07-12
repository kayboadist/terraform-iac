resource "azurerm_virtual_network" "first-vnet" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "kaysfirst-network-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.first-rg.name
  virtual_network_name = azurerm_virtual_network.first-vnet.name
  address_prefixes     = var.address_prefixes
}