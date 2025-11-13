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
    pip_name            = string
    vnet_name           = string
    ip_configuration = map(object({
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
