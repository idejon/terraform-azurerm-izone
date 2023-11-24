## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.gwsubnetid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.rgide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.rgname](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.vnetid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.vnetname](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_public_ip.gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.contribute](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_contribute"></a> [aad\_contribute](#input\_aad\_contribute) | Object ID of group to be granted contribute | `string` | `"cbc6f689-d627-463f-a655-990c9fccbc78"` | no |
| <a name="input_aad_tenant_id"></a> [aad\_tenant\_id](#input\_aad\_tenant\_id) | n/a | `string` | `"a3cf2d78-d6ac-45b0-923e-92ec2bc23280"` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | # Network ## | `list(string)` | <pre>[<br>  "172.27.0.0/16"<br>]</pre> | no |
| <a name="input_create_vpn"></a> [create\_vpn](#input\_create\_vpn) | 1 to create VPN gateway | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_gateway_prefix"></a> [gateway\_prefix](#input\_gateway\_prefix) | Only required with create\_vpn = 1 | `list(string)` | <pre>[<br>  "172.27.100.0/24"<br>]</pre> | no |
| <a name="input_gateway_sku"></a> [gateway\_sku](#input\_gateway\_sku) | Only required with create\_vpn = 1 | `string` | `"VpnGw1"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"centralus"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | n/a | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_avnet-gwsubnet-id"></a> [avnet-gwsubnet-id](#output\_avnet-gwsubnet-id) | n/a |
| <a name="output_rg-id"></a> [rg-id](#output\_rg-id) | n/a |
| <a name="output_rg-name"></a> [rg-name](#output\_rg-name) | n/a |
| <a name="output_vnet-id"></a> [vnet-id](#output\_vnet-id) | n/a |
| <a name="output_vnet-name"></a> [vnet-name](#output\_vnet-name) | n/a |
