##Creating all IP-Netmask objects through one terraform resource
resource "panos_address_object" "custom_ip_objects" {
    
    name = replace(var.ip_objects[*], "/", "_") 
    value = var.ip_objects[*] 
    type = "ip-netmask"

    lifecycle {
        create_before_destroy = true
    }
    
}


##Creating all FQDN objects through one terraform resource
resource "panos_address_object" "custom_fqdn_objects" {
    count = var.fqdn_objects_count

    name = var.fqdn_objects[count.index]    ##Planing on testing it with a "var.fqdn_objects[*]" to not use the count varible.
    value = var.fqdn_objects[count.index]   ##Planing on testing it with a "var.fqdn_objects[*]" to not use the count varible.
    type = "fqdn"

    lifecycle {
        create_before_destroy = true
    }
    
}



##Creating Objects Groups
resource "panos_address_group" "rfc_1918" {

    name = var.object_group[0]
    description = "All Internal Subnets"
    static_addresses = [
        replace(var.ip_objects[0], "/", "_"),
        replace(var.ip_objects[1], "/", "_"),
        replace(var.ip_objects[2], "/", "_")
    ]

    depends_on = [panos_address_object.custom_fqdn_objects, panos_address_object.custom_ip_objects]

    lifecycle {
        create_before_destroy = true
    }
}