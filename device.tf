resource "panos_ldap_profile" "ldap_server" {
    name = "LDAP Server"
    base_dn = "baseDn"
    ldap_type = "active-directory"
    bind_dn = "bindDn"
    password = "secret"
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
