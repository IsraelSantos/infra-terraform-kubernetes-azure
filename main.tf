# Configure the AWS provider
provider "azurerm" {
  version = "=2.40.0"
  features {}
}

resource "azurerm_resource_group" "meu_grupo_de_recursos" {
  name     = "meu_grupo_de_recursos"
  location = var.app-location
}

# Configure AKS cluster
resource "azurerm_kubernetes_cluster" "meu-cluster" {
  name                = "meu-aks"
  location            = var.app-location
  resource_group_name = azurerm_resource_group.meu_grupo_de_recursos.name
  dns_prefix          = "dns-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.app-id
    client_secret = var.app-password
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

  tags = {
    environment = "Demo"
  }
}
