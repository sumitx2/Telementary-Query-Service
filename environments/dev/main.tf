module "rg" {
    source = "../../modules/azurerm_resource_group"
    rgm= var.rgp
}

module "vnet" {
    source = "../../modules/azurerm_virtual_network"
    vnetsm = var.vnetsp
    depends_on =[module.rg]
}

module "subnet" {
    source = "../../modules/azurerm_subnet"
    subnetsm = var.subnetsp
    depends_on = [ module.vnet, module.rg ]
}

module "vm" {
    source = "../../modules/azurerm_virtual_machine"
    vmm = var.vmp
    depends_on = [ module.pip, module.subnet ]
}

module "pip" {
    source = "../../modules/azurerm_public_ip"
    pipm = var.pipp
    depends_on = [ module.rg ]
}