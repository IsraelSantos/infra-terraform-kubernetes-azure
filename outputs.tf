output "app-name" {
  value = var.app-name
}

output "resource_group_name" {
  value = azurerm_resource_group.meu_grupo_de_recursos.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.meu-cluster.name
}