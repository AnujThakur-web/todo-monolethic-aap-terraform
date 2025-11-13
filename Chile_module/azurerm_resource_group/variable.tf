variable "resource_groups" {
  description = "Map of Azure resource groups"
  type = map(object({
    resource_group_name     = string
    location = string
    managed_by              = optional(string)
    tags                    = optional(map(string))
  }))
}
