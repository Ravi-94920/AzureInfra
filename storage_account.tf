resource "azurerm_storage_account" "example" {
  name                     = "devopsterraform"
  resource_group_name     = "InvenicsDevOps-rg"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  tags = {
    Environment = "Dev"
  }
}