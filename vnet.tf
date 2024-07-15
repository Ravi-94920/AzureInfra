resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  location            = "centralindia"
  resource_group_name = "InvenicsDevOps-rg"
  address_space       = ["10.0.0.0/16"]
}