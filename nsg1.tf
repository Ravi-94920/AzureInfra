resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = "centralindia"
  resource_group_name = "InvenicsDevOps-rg"

  security_rule {
    name                       = "allow-ssh"
    description                 = "Allow SSH access"
    access                     = "Allow"
    direction                   = "Inbound"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
    name                       = "allow-http"
    description                 = "Allow HTTP access"
    access                     = "Allow"
    direction                   = "Inbound"
    priority                    = 101
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}