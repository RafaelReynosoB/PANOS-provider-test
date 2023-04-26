#Defining a resource to create all L3 needed interfaces through the variables
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