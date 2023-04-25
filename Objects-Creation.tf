##OBJECTS DEFINITION



##OBJECTS CREATION
##Creating all IP-Netmask objects through one terraform resource
resource "panos_address_object" "custom_ip_objects" {
    count = length(var.ip_objects)
    
    name = replace(var.ip_objects[count.index], "/", "_") 
    value = var.ip_objects[count.index] 
    type = "ip-netmask"

    lifecycle {
        create_before_destroy = true
    }
    
}


##Creating all FQDN objects through one terraform resource
resource "panos_address_object" "custom_fqdn_objects" {
    count = length(var.fqdn_objects)

    name = var.fqdn_objects[count.index]   
    value = var.fqdn_objects[count.index]   
    type = "fqdn"

    lifecycle {
        create_before_destroy = true
    }
    
}



##Creating all FQDN objects through one terraform resource
resource "panos_address_object" "custom_ip_range_objects" {
    count = length(var.ip_range_objects)

    name = var.ip_range_objects[count.index]   
    value = var.ip_range_objects[count.index]   
    type = "ip-range"

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
