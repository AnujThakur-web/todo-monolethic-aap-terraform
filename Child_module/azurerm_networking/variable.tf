variable "vnet" {
  type = map(object({
    vnet_name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(map(object({
     subnet_name             = string
      address_prefixes = list(string)
    })))
  }))
}
