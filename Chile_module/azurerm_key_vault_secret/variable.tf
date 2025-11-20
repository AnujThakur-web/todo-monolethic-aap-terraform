variable "kvs" {
  type = map(object({
    kvs-name            = string
    value               = optional(string)
    kvd_name            = string
    resource_group_name = string
    }
  ))
}

