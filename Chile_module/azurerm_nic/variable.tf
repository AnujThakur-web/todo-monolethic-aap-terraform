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
    pip_alloc = string
    }))


  }))

}

variable "public_ips" {
  description = "Map of public IPs (from public_ip module output). Expected to be a map where each value contains an `id` attribute.`"
  type        = map(any)
  default     = {}
}

