##L3 Interface variables and resource definition 
variable "l3_interface" {
  type = list(string)
  description = "Layer 3 type interface"
}

variable "l3_interface_ip" {
  type = list(list(string))
  description = "Interface's IPs"
}

variable "l3_interface_comment" {
  type = list(string)
  description = "Comments added to the L3 Interfaces"
}

variable "l3_zone1" {
    type = string
    description = "Zone 1 definition"
}

variable "l3_zone1_eth" {
    type = list(string)
    description = "Interfaces part of the Zone 1"
}

variable "l3_zone2" {
    type = string
    description = "Zone 2 definition"
}

variable "l3_zone2_eth" {
    type = list(string)
    description = "Interfaces part of the Zone 2"
}


resource "panos_ethernet_interface" "l3_interface" {
    count = length(var.l3_interface)

    name = var.l3_interface[count.index]
    vsys = "vsys1"
    mode = "layer3"
    static_ips = var.l3_interface_ip[count.index]
    comment = var.l3_interface_comment[count.index]

    lifecycle {
        create_before_destroy = true
    }
}


resource "panos_zone" "l3_zone1" {

    name = var.l3_zone1
    mode = "layer3"
    interfaces = [
        var.l3_zone1_eth[0],   
    ]
    enable_user_id = true

    lifecycle {
        create_before_destroy = true
    }
}


resource "panos_zone" "l3_zone2" {

    name = var.l3_zone2
    mode = "layer3"
    interfaces = [
        var.l3_zone2_eth[0],
    ]
    enable_user_id = true

    lifecycle {
        create_before_destroy = true
    }
}
