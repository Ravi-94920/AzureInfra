resource "azurerm_linux_web_app" "example" {
  location           = "centralindia"
  resource_group_name = "example-resources"
  name               = "webapp1"
  app_service_plan_id = azurerm_app_service_plan.example.id
  site_config {
    linux_fx_version = "PYTHON|12.0"
  }
}

resource "azurerm_app_service_plan" "example" {
  location           = "westus2"
  resource_group_name = "example-resources"
  name               = "example-app-service-plan"
  sku {
    tier  = "Free"
    size  = "F1"
    family = "F"
  }
}