 ## Base ##
variable "name" {
  type    = string
}
variable "environment" {
  type    = string
  default = "dev"
}
variable "location" {
  type    = string
  default = "centralus"
}
variable "aad_tenant_id" {
  type    = string
  default = "a3cf2d78-d6ac-45b0-923e-92ec2bc23280"
}
## Network ##
variable "address_space" {
  type = list(string)
  default = [ "172.27.0.0/16" ]
}
variable "public_ip_sku" {
  type    = string
  default = "Standard"
}
# Gateway 
variable "create_vpn" {
  type = bool
  description = "1 to create VPN gateway"
  default = false
}
variable "gateway_prefix" {
  type = list(string)
  description = "Only required with create_vpn = 1"
  default = [ "172.27.100.0/24" ]
}
variable "gateway_sku" {
  type    = string
  description = "Only required with create_vpn = 1"
  default = "VpnGw1"
}
## Authentication
variable "aad_contribute"{
  type    = string
  description = "Object ID of group to be granted contribute"
  default = "cbc6f689-d627-463f-a655-990c9fccbc78"
}
