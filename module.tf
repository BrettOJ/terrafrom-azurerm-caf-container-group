resource "azurerm_container_group" "contgroup" {
  name                = var.cont_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label
  os_type             = var.os_type
  tags                = var.tags

  container {
    name   = lookup(var.container_config, "name", null)
    image  = lookup(var.container_config, "image", null)
    cpu    = lookup(var.container_config, "cpu", null)
    memory = lookup(var.container_config, "memory", null)

    ports {
      port     = lookup(var.ports_config, "port", null)
      protocol = lookup(var.ports_config, "protocol", null)
    }
  }
}