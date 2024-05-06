resource "azurerm_kubernetes_cluster_node_pool" "win101" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = 1
  name                  = "win101"
  os_disk_size_gb       = 40
  os_type               = "Windows" # Default is Linux, we can change to Windows
  vm_size               = "Standard_B2ms"



}