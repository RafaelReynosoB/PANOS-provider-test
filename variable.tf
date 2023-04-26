
variable "l3_interface" {
  type = list(string)
  description = "Layer 3 type interface"
}


variable "l3_interface_ip" {
  type = list(string)
  description = "Interface's IPs"
}


variable "l3_interface_comment" {
  type = list(string)
  description = "Comments added to the L3 Interfaces"
}