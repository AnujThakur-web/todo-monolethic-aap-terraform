variable "resource_groups" {
  description = "Map of Azure resource groups"
  type = map(object({
    resource_group_name = string
    location            = string
    managed_by          = optional(string)
    tags                = optional(map(string))
  }))
}

variable "vnet" {

  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(map(object({
      subnet_name      = string
      address_prefixes = list(string)
    })))
  }))
}

variable "public_ips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}

variable "nic" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    pipd_name           = string
    ip_configuration = list(object({
      ip_config_name = string
      pip_alloc      = string
    }))
  }))

}

variable "vms" {
  description = "Map of virtual machines and their configurations"
  type = map(object({
    nic_name                        = string
    location                        = string
    resource_group_name             = string
    vnet_name                       = string
    subnet_name                     = string
    pip_name                        = string
    virtual_machine_name            = string
    size                            = string
    admin_username                  = optional(string)
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool)

  }))
}

variable "kv" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = string
    tenant_id                   = string
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
  }))
}

variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      destination_address_prefix = string
      source_address_prefix      = string
    })))
    tags = optional(map(string))
  }))
}

variable "kvs" {
  type = map(object({
    kvs-name            = string
    value               = optional(string)
    kvd_name            = string
    resource_group_name = string
    }
  ))
}

variable "sql_server" {
  type = map(object({
    sql_svr_name                 = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)

  }))
}

variable "sql_dbs" {
  type = map(object({
    sql_svr_name        = string
    sql_db_name         = string
    resource_group_name = string
    collation           = optional(string)
    license_type        = optional(string)
    max_size_gb         = optional(string)
    sku_name            = optional(string)
    enclave_type        = optional(string)
    tags                = optional(map(string))

  }))

}




