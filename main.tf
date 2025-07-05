# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

 features {} 
 subscription_id = "675ec6f5-d0e6-4d1e-a3b5-f9c3f3508ba5" 
}

# Create a resource group
resource "azurerm_resource_group" "first-rg" {
  name     = "kaysfirst-rg"
  location = "Central US"
}

resource "azurerm_virtual_network" "first-vnet" {
  name                = "kaysfirst-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
}

resource "azurerm_subnet" "kaysfirst-network-subnet" {
  name                 = "kaysfirst-network-subnet"
  resource_group_name  = azurerm_resource_group.first-rg.name
  virtual_network_name = azurerm_virtual_network.first-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "kaysfirst-nint" {
  name                = "kaysfirst-nint"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.kaysfirst-network-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "kaysfirst-vm" {
  name                  = "kaysfirst-vm"
  location              = azurerm_resource_group.first-rg.location
  resource_group_name   = azurerm_resource_group.first-rg.name
  network_interface_ids = [azurerm_network_interface.kaysfirst-nint.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azurerm_public_ip" "kaysfirst-pip" {
  name                = "kaysfirst-pip"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "kaysfirst-nintip" {
  name                = "kaysfirst-nintip"
  location            = azurerm_resource_group.first-rg.location
  resource_group_name = azurerm_resource_group.first-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.kaysfirst-network-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.kaysfirst-pip.id
  }
}

