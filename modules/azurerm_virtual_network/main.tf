

resource "azurerm_virtual_network" "Vnet"{
for_each = var.vnetsm
name = each.value.name
resource_group_name = each.value.rgname
location = each.value.location
address_space       = each.value.address_space
}