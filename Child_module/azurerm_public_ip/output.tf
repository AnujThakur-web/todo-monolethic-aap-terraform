 output "public_ip_addresses" {  
    #  "public_ip_addresses" is pout block name
  description = "Output map of created Public IPs"
  value = {
    for k, v in azurerm_public_ip.public_ip : k => {
      name           = v.name
      id             = v.id
      ip_address     = v.ip_address
      fqdn           = v.fqdn
      allocation     = v.allocation_method
      sku            = v.sku
      location       = v.location
      resource_group = v.resource_group_name
    }
  }
 }
