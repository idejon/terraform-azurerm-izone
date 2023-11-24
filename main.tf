## Data ##
data "azurerm_client_config" "current" {}

## Resources in this module ##
resource "azurerm_resource_group" "this" {
  name     =  "${var.environment}-${var.name}-${var.location}-rg"
  location = var.location
}

## VNET ##
resource "azurerm_virtual_network" "this" {
  name                =  "${var.environment}-${var.name}-${var.location}-vnet"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.address_space
}

## Gateway ##
resource "azurerm_subnet" "gateway" {
  count               = var.create_vpn ? 1 : 0
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.gateway_prefix
}
resource "azurerm_public_ip" "gateway" {
  count               = var.create_vpn ? 1 : 0
  name                = "${var.environment}-${var.name}-${var.location}-gw"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 =  var.public_ip_sku
}
resource "azurerm_virtual_network_gateway" "this" {
  count               = var.create_vpn ? 1 : 0
  name                = "vpn-${var.location}-gw"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = var.gateway_sku

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.gateway[0].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway[0].id
  }
  vpn_client_configuration {
    address_space                 = ["10.6.9.0/24"]
    aad_audience                  = var.aad_contribute
    aad_tenant                    = "https://login.microsoftonline.com/${var.aad_tenant_id}"
    aad_issuer                    = "https://sts.windows.net/${var.aad_tenant_id}/"
    vpn_client_protocols          = ["OpenVPN"]
  }
}

## Keyvault ##
resource "azurerm_key_vault" "this" {
  name                            =  "${var.environment}-${var.name}-${var.location}-kv"
  location                        = azurerm_resource_group.this.location
  resource_group_name             = azurerm_resource_group.this.name
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  sku_name = "standard"
}
#
# Export resource values to keyvault
#
resource "azurerm_key_vault_secret" "rgname" {
  name            = "rg-name"
  value           = azurerm_resource_group.this.name
  key_vault_id    = azurerm_key_vault.this.id
}
resource "azurerm_key_vault_secret" "rgide" {
  name            = "rg-id"
  value           = azurerm_resource_group.this.id
  key_vault_id    = azurerm_key_vault.this.id
}
resource "azurerm_key_vault_secret" "vnetname" {
  name            = "vnet-name"
  value           = azurerm_virtual_network.this.id
  key_vault_id    = azurerm_key_vault.this.id
}
resource "azurerm_key_vault_secret" "vnetid" {
  name            = "vnet-id"
  value           = azurerm_virtual_network.this.id
  key_vault_id    = azurerm_key_vault.this.id
}
resource "azurerm_key_vault_secret" "gwsubnetid" {
  count               = var.create_vpn ? 1 : 0
  name            = "vnet-gwsubnet-id"
  value           = azurerm_subnet.gateway[0].id
  key_vault_id    = azurerm_key_vault.this.id
}

# User Permissions
resource "azurerm_role_assignment" "contribute" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Contributor"
  principal_id         = var.aad_contribute
}

