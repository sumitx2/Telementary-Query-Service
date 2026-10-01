resource "azurerm_network_interface" "NIC" {
    for_each = var.vmm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}



resource "azurerm_linux_virtual_machine" "example" {
    for_each = var.vmm
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_B2ats_v2"
  admin_username      = "rajpoot1992"
  admin_password      = "rajpoot@1992"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.NIC[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}