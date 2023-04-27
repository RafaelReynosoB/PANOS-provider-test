variable "ldap_name" {
    type = list(string)
    description = "Name of each of the LDAP Server Profile to be created"
}

variable "ldap_base_dn" {
    type = list(string)
    description = "Base DN of each of the LDAP Server Profile to be created"
}

variable "ldap_bind_dn" {
    type = list(string)
    description = "Bind DN of each of the LDAP Server Profile to be created"
}

variable "ldap_password" {
    type = list(string)
    description = "Password of each of the LDAP Server Profile to be created"
    sensitive = true
}


##All Active-Directory LDAP profiles
resource "panos_ldap_profile" "ldap_server" {
    count = length(var.ldap_name)

    name = var.ldap_name[count.index]
    base_dn = var.ldap_base_dn[count.index]
    ldap_type = "active-directory"
    bind_dn = var.ldap_bind_dn[count.index]
    password = var.ldap_password[count.index]
    bind_timeout = 5
    search_timeout = 7
    retry_interval = 120
    server {
        name = "DC1"
        server = "dc.bridgeitconsulting.com"
    }
    server {
        name = "DC2"
        server = "10.0.0.5"
        port = 636
    }


    lifecycle {
        create_before_destroy = true
    }
}
