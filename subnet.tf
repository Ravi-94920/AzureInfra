resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = "example-resources"
  virtual_network_name = "example-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}