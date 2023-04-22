
variable "user1"{
    type = string
    sensitive   = true
    description = "Username used to log into the Palo Alto firewall"
}

variable "user1_pass"{
    type = string
    sensitive   = true
    description = "Password for User1"
}

variable "ip_objects_count"{
  type        = number
  description = "Number of IP objects to create in PA-FW"
  default     = length(var.ip_objects)
}


variable "ip_objects" {
  type        = list(string)
  description = "All IP-Netmask objects to be created"
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}


variable "fqdn_objects_count"{
  type        = number
  description = "Number of FQDN objects to create in PA-FW"
  default     = 2
}

variable "fqdn_objects" {
  type        = list(string)
  description = "All FQDN objects to be created"
  default     = ["google.com", "brideitconsulting.com"]
}

variable "object_group" {               
## I was planinig on using just one resource to deploy all the Object Groups but thinking it later, it makes no sense cause all the groups have different objects in it.
    type = list(string)
    description = "All groups to be created"
    default = ["RFC_1918"]
}
