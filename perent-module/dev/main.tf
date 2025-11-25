module "resource_group" {
  source          = "../../Chile_module/azurerm_resource_group"
  resource_groups = var.resource_groups

}

module "vnet" {

  source     = "../../Chile_module/azurerm_networking"
  vnet       = var.vnet
  depends_on = [module.resource_group]

}

module "public_ip" {
  source     = "../../Chile_module/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_group]

}

module "nic" {
  source     = "../../Chile_module/azurerm_network_Interface"
  nic        = var.nic
  depends_on = [module.resource_group, module.vnet, module.public_ip]
}

module "vm" {
  source     = "../../Chile_module/azurerm_linux_machine"
  vms        = var.vms
  depends_on = [module.resource_group, module.vnet, module.nic]
}

module "kv" {
  depends_on = [module.resource_group]
  source     = "../../Chile_module/azurerm_key_vault"
  kv         = var.kv

}


module "nsg" {
  depends_on = [module.resource_group, module.nic]
  source     = "../../Chile_module/azurerm_network_security_group"
  nsg        = var.nsg

}


module "kv_secrets1" {
  depends_on = [ module.resource_group , module.kv ]
  source = "../../Chile_module/azurerm_key_vault_secret"
  kvs = var.kvs

  
}

module "sql-server" {
  depends_on = [ module.resource_group ]
  source = "../../Chile_module/azurerm_sql_server"
  sql_server = var.sql_server
  
}

module "sql-databse" {
  depends_on = [ module.resource_group , module.sql-server ]
  source = "../../Chile_module/azurerm_sql_database"
  sql_dbs = var.sql_dbs
  
}