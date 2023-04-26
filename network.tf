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
