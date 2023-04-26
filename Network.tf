resource "panos_ethernet_interface" "l3_interfaces" {
    name = "ethernet1/7"
    vsys = "vsys1"
    mode = "layer3"
    static_ips = ["10.1.1.1/24"]
    comment = "Internal Traffic"

    lifecycle {
        create_before_destroy = true
    }
}