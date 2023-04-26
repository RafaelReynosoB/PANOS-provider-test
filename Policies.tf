terraform {
  required_providers {
    panos = {
      source = "PaloAltoNetworks/panos"
      version = "1.11.1"
    }
  }
}

provider "panos" {
    hostname = "73.202.181.176"
}



##Policies Rules
resource "panos_security_policy" "security_rules" {    

    rule {
        name = "Any-to-Google"
        source_zones = ["any"]
        source_addresses = ["any"]
        source_users = ["any"]
        destination_zones = ["any"]
        destination_addresses = [var.fqdn_objects[0]]
        applications = ["any"]
        services = ["application-default"]
        categories = ["any"]
        action = "allow"
        description = "Special rule for google configured through Terraform"
    }
    rule {
        name = "Trust-to-Untrust"
        source_zones = ["trust"]
        source_addresses = [panos_address_group.rfc_1918.name]
        source_users = ["any"]
        destination_zones = ["untrust"]
        destination_addresses = [panos_address_group.rfc_1918.name]
        negate_destination = true
        applications = ["any"]
        services = ["application-default"]
        categories = ["any"]
        action = "allow"
        description = "Internet-Outbound Rule configured through Terraform"
    }

    rule {
        name = "Untrust-to-Trust"
        source_zones = ["untrust"]
        source_addresses = [panos_address_group.rfc_1918.name]
        negate_source = true
        source_users = ["any"]
        destination_zones = ["trust"]
        destination_addresses = [panos_address_group.rfc_1918.name]
        applications = ["any"]
        services = ["application-default"]
        categories = ["any"]
        action = "allow"
        description = "Internet-Inbound Rule configured through Terraform"
    }
    rule {
        name = "Any-to-Any"
        source_zones = ["any"]
        source_addresses = ["any"]
        source_users = ["any"]
        destination_zones = ["any"]
        destination_addresses = ["any"]
        applications = ["any"]
        services = ["application-default"]
        categories = ["any"]
        action = "allow"
        description = "Catch all allow rule configured through Terraform"
    }



    lifecycle {
        create_before_destroy = true
    }
}


