output "rg-name" {
  value = azurerm_resource_group.this.name
}
output "rg-id" {
  value = azurerm_resource_group.this.id
}
output "vnet-name" {
  value = azurerm_virtual_network.this.name
}
output "vnet-id" {
  value = azurerm_virtual_network.this.id
}
output "avnet-gwsubnet-id" {
  value = var.create_vpn ? azurerm_subnet.gateway[0].id : null
}

