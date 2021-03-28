# Configure the AWS provider
provider "azurerm" {
  version = "=2.40.0"
  features {}
}

resource "azurerm_resource_group" "meu_grupo_de_recursos" {
  name     = "meu_grupo_de_recursos"
  location = var.app-location
}

