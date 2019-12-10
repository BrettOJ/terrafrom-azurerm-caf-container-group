resource "azurerm_container_group" "contgroup" {
  name                = var.cont_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ipaddress
  dns_name_label      = var.dns_label
  os_type             = var.os_type

  container {
    name   = var.cont_name
    image  = var.cont_image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = var.port_protocol
    }
  }
}