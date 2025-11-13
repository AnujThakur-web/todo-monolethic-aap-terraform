module "resource_group" {
  source          = "../Chile_module/azurerm_resource_group"
  resource_groups = var.resource_groups

}

module "vnet" {

  source     = "../Chile_module/azurerm_networking"
  vnet       = var.vnet
  depends_on = [module.resource_group]

}

module "public_ip" {
  source     = "../Chile_module/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_group]

}

module "nic" {
  source     = "../Chile_module/azurerm_nic"
  nic        = var.nic
  public_ips = module.public_ip.public_ip_addresses
  depends_on = [module.resource_group, module.vnet, module.public_ip]
}

module "vm" {
  source     = "../Chile_module/azurerm_linux_machine"
  vms        = var.vms
  depends_on = [module.resource_group, module.vnet, module.nic]
}

module "kv" {
  depends_on = [ module.resource_group ]
  source = "../Chile_module/azurerm_keyveault"
  kv = var.kv
  
}
