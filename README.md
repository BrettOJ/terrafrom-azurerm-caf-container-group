

#######to do - update 



# Creates an Azure container group with in a specified registry

Creates an Azure container group with in a specified registry in a specific region

Reference the module to a specific version (recommended):

```hcl
resource "azurerm_container_group" "contgroup" {
    source              = "git://github.com/aztfmod/container_registry.git?ref=latest"

####TODO - add version number onle in the hashicorp registry

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
```

Or get the latest version
source                  = "git://github.com/aztfmod/container_registry.git?ref=latest"
```hcl
module "resource_groups" {
    source                  = "git://github.com/aztfmod/container_registry.git?ref=latest"
    resource_group_name      = var.resource_group_name
    location                 = var.location
    name                     = var.container_registry_name
    sku                      = var.sku
    admin_enabled            = var.admin_enabled
}
```

# Parameters

## resource_groups

(Required) Object that describes the resource groups to be created with their geo.
Global group of tags will be added to all RG, specific tags can be added per RG.

```hcl
variable "container_registry_name" {
  description = "Name of the container registry"
}
```
 
```hcl

variable "admin_enabled" {
  
}
```

```hcl
variable "location" {
  description = "location of the variable group"
}

```

```hcl
variable "sku" {
  description = "Sku of the container registry"
}
```

## prefix

(Optional) You can use a prefix to add to the list of resource groups you want to create

```hcl
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}
```

Example

```hcl
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```

# Output

## object

Returns the full set of created resource groups as a map, as follows:

```hcl







```
