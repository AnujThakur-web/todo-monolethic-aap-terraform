variable "vms" {
  description = "Map of virtual machines and their configurations"
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    vnet_name            = string
    subnet_name          = string
    pip_name             = string
    virtual_machine_name = string
    size                 = string
    admin_username       = optional(string)
    admin_password       = optional(string)
    disable_password_authentication = optional(bool)
    }))
  }






