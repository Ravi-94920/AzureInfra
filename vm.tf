terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_linux_virtual_machine" "example" {
  name                 = "example-vm"
  location             = "westus2"
  resource_group_name  = "example-resources"
  size                 = "Standard_B2s"
  admin_username       = "azureuser"
  admin_password       = "P@sswOrd1"
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "Latest"
  }
  network_interface_ids = [azurerm_network_interface.example.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  disable_password_authentication = false
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = "westus2"
  resource_group_name = "example-resources"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                      = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
  security_group_ids = [azurerm_network_security_group.example.id]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "example-resources"
  virtual_network_name = "example-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "example" {
  name                 = "example-vnet"
  location             = "westus2"
  resource_group_name  = "example-resources"
  address_space        = ["10.0.0.0/16"]
}

resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = "westus2"
  resource_group_name = "example-resources"
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                = "allow-ssh"
  resource_group_name = "example-resources"
  network_security_group_name = azurerm_network_security_group.example.name
  priority            = 100
  direction           = "Inbound"
  access              = "Allow"
  protocol            = "Tcp"
  source_port_range    = "*"
  destination_port_range = "22"
  source_address_prefix  = "*"
  destination_address_prefix = "*"
}

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  location            = "westus2"
  resource_group_name = "example-resources"
  allocation_method  = "Dynamic"
  sku                = "Standard"
}