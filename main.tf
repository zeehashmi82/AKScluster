resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group

  default_node_pool {
    name       = "system"
    node_count = "1"
    vm_size    = "Standard_A2_v2"

  }


  identity {
    type = "SystemAssigned"
  }

  windows_profile {
    admin_username = "adminusername"
    admin_password = "Dangerzone!@#$%^&*()"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
  }
}
