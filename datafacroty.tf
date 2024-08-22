resource "azurerm_data_factory" "example" {
  name                = "example-data-factory"
  location            = "Centralindia"
  resource_group_name = "example-resources"
  identity {
    type = "SystemAssigned"
  }
}