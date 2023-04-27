########## Objects Tab ##########
#Address Object variables
ip_objects = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
ip_range_objects = ["10.0.0.25-10.0.0.35"]
fqdn_objects = ["google.com", "brideitconsulting.com"]


########## Network Tab ########## 
#Interface variables
l3_interface = ["ethernet1/7","ethernet1/8"]
l3_interface_ip = [["10.1.1.1/24", "10.1.1.254/24"],["10.1.2.1/24"]]
l3_interface_comment = ["For all Internal (Trust) Traffic", "For all External (Untrust) Traffic"]

#Zone variables
l3_zone1 = "Trusted-Zone"
l3_zone1_eth = [ "ethernet1/7" ]
l3_zone2 = "Untrusted-Zone"
l3_zone2_eth = [ "ethernet1/8" ]


########## Device Tab ##########
ldap_name = [ "LDAP-Server-1" ]
ldap_base_dn = [ "BaseDN" ]
ldap_bind_dn = [ "BindDN" ]
ldap_password = [ "Secret" ]