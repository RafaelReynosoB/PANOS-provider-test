##Creating all IP-Netmask objects through one terraform resource
resource "panos_address_object" "custom_ip_objects" {
    count = var.ip_objects_count
    name = replace(var.ip_objects[count.index], "/", "_")       ##Planing on testing it with a "var.ip_objects[*]" to not use the count varible.
    value = var.ip_objects[count.index]     ##Planing on testing it with a "var.ip_objects[*]" to not use the count varible.
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
resource "panos_address_group" "RFC_1918" {
    depends_on = [panos_address_object.custom_fqdn_objects, panos_address_object.custom_ip_objects]
    name = var.object_group[0]
    description = "All Internal Subnets"
    static_addresses = [
        replace(var.ip_objects[0], "/", "_"),
        replace(var.ip_objects[1], "/", "_"),
        replace(var.ip_objects[2], "/", "_")
    ]
    lifecycle {
        create_before_destroy = true
    }
}