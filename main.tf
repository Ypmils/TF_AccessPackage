resource "azuread_access_package_catalog" "example1" {
  display_name = "example-catalog"
  description  = "Example catalog"
}

resource "azuread_access_package_catalog" "example2" {
  display_name = "example-catalog2"
  description  = "Example catalog2"
}

resource "azuread_access_package" "examplePackage" {
  catalog_id   = azuread_access_package_catalog.example1.id
  display_name = "access-package"
  description  = "Access Package"
}

resource "azuread_access_package" "examplePackage2" {
  catalog_id   = azuread_access_package_catalog.example2.id
  display_name = "access-package2"
  description  = "Access Package2"
}



resource "azuread_group" "ap_example" {
  display_name     = "ap_example-group"
  security_enabled = true
}

resource "azuread_group" "ap_2" {
    administrative_unit_ids        = [
       "deee597e-2576-4817-b296-210fec44cf76",
    ]
    assignable_to_role             = false
    auto_subscribe_new_members     = false
    behaviors                      = []
    description                    = null
    display_name                   = "GR2"
    external_senders_allowed       = false
    hide_from_address_lists        = false
    hide_from_outlook_clients      = false
    mail                           = null
    mail_enabled                   = false
    mail_nickname                  = "2d4884fd-6"
    members                        = []
    preferred_language             = null
    prevent_duplicate_names        = false
    provisioning_options           = []
    security_enabled               = true
    theme                          = null
    types                          = []
    visibility                     = null
    writeback_enabled              = false 
}


resource "azuread_group" "ap_4" {
    administrative_unit_ids        = [
       "deee597e-2576-4817-b296-210fec44cf76",
    ]
    assignable_to_role             = false
    auto_subscribe_new_members     = false
    behaviors                      = []
    description                    = null
    display_name                   = "GR4"
    external_senders_allowed       = false
    hide_from_address_lists        = false
    hide_from_outlook_clients      = false
    mail                           = null
    mail_enabled                   = false
    members                        = []
    preferred_language             = null
    prevent_duplicate_names        = false
    provisioning_options           = []
    security_enabled               = true
    theme                          = null
    types                          = []
    visibility                     = null
    writeback_enabled              = false 
}



resource "azuread_group" "ap_1" {
    assignable_to_role             = true
    auto_subscribe_new_members     = false
    behaviors                      = []
    description                    = null
    display_name                   = "GR1"
    external_senders_allowed       = false
    hide_from_address_lists        = false
    hide_from_outlook_clients      = false
    mail                           = null
    mail_enabled                   = false
    mail_nickname                  = "58a2729f-f"
    members                        = []
    preferred_language             = null
    prevent_duplicate_names        = false
    provisioning_options           = []
    security_enabled               = true
    theme                          = null
    types                          = []
    visibility                     = "Private"
    writeback_enabled              = false
    #owners                         = ["c4168f70-1e20-4010-a582-8648f660b17b"]
}



###### PIM GROUP POLICY SETTINGS
resource "azuread_group_role_management_policy" "example" {
  group_id = azuread_group.ap_1.object_id
  role_id  = "member"

  active_assignment_rules {
    expire_after = "P365D"
  }

  eligible_assignment_rules {
    expiration_required = false
  }

}
  ####







#resource "azuread_group" "ap_3" {
# #administrative_unit_ids        = [
# #       "deee597e-2576-4817-b296-210fec44cf76",
# #   ]
#   lifecycle {
#      ignore_changes = [administrative_unit_ids]
#    }
#    assignable_to_role             = true
#    auto_subscribe_new_members     = false
#    behaviors                      = []
#    description                    = null
#    display_name                   = "GR3"
#    external_senders_allowed       = false
#    hide_from_address_lists        = false
#    hide_from_outlook_clients      = false
#    mail                           = null
#    mail_enabled                   = false
#    members                        = []
#    preferred_language             = null
#    prevent_duplicate_names        = false
#    provisioning_options           = []
#    security_enabled               = true
#    theme                          = null
#    types                          = []
#    visibility                     = "Private"
#    writeback_enabled              = false
#    owners                         = ["c4168f70-1e20-4010-a582-8648f660b17b"]
#}


resource "azuread_group" "gr6" {
    lifecycle {
      ignore_changes = [administrative_unit_ids]
    }
    assignable_to_role             = true
    auto_subscribe_new_members     = false
    behaviors                      = []
    description                    = null
    display_name                   = "GR6"
    external_senders_allowed       = false
    hide_from_address_lists        = false
    hide_from_outlook_clients      = false
    mail                           = null
    mail_enabled                   = false
    members                        = []
    preferred_language             = null
    prevent_duplicate_names        = false
    provisioning_options           = []
    security_enabled               = true
    theme                          = null
    types                          = []
    visibility                     = "Private"
    writeback_enabled              = false
    owners                         = []
}




#import {
#  to = azuread_group.ap_1
#  id = "e7ae6b4b-c2ad-448d-abdf-63a143496314"
#}

# terraform import azuread_group.example d1f3a8b5-1234-4f56-9abc-98765ef12345
#terraform state show azuread_group.ap_2


#### LOG

# Set log level (TRACE = very verbose)
# $env:TF_LOG = "TRACE"

# Send logs to a file
# $env:TF_LOG_PATH = "terraform.log"


# Assign resource to catalog
#resource "azuread_access_package_resource_catalog_association" "example" {
#  catalog_id             = azuread_access_package_catalog.example1.id
#  resource_origin_id     = azuread_group.ap_example.object_id
#  resource_origin_system = "AadGroup"
#}
#
#resource "azuread_access_package_resource_package_association" "example" {
#  access_package_id               = azuread_access_package.examplePackage.id
#  catalog_resource_association_id = azuread_access_package_resource_catalog_association.example.id
#}
#

## GR2 test
#resource "azuread_access_package_resource_catalog_association" "example2" {
#  catalog_id             = azuread_access_package_catalog.example1.id
#  resource_origin_id     = azuread_group.ap_2.object_id
#  resource_origin_system = "AadGroup"
#}
#
#resource "azuread_access_package_resource_package_association" "example2" {
#  access_package_id               = azuread_access_package.examplePackage.id
#  catalog_resource_association_id = azuread_access_package_resource_catalog_association.example2.id
#}
#


#RMAU Group test
resource "azuread_access_package_resource_catalog_association" "example3" {
  catalog_id             = azuread_access_package_catalog.example1.id
  resource_origin_id     = azuread_group.ap_1.object_id
  resource_origin_system = "AadGroup"
}

resource "azuread_access_package_resource_package_association" "example3" {
  access_package_id               = azuread_access_package.examplePackage.id
  catalog_resource_association_id = azuread_access_package_resource_catalog_association.example3.id
}





### Administrative unit testing

resource "azuread_administrative_unit" "example" {
  display_name = "Example-AU"
  
}

#resource "azuread_administrative_unit_member" "example" {
#  administrative_unit_object_id = azuread_administrative_unit.example.object_id
#  member_object_id              = azuread_group.gr6.object_id
#}

resource "azuread_administrative_unit" "rmau_mantest" {
  display_name              = "RMAU_MAN"
}

resource "azuread_administrative_unit_member" "gr6" {
  administrative_unit_object_id = azuread_administrative_unit.rmau_mantest.object_id
  member_object_id              = azuread_group.gr6.object_id
}
#terraform import azuread_administrative_unit.rmau_mantest /directory/administrativeUnits/3eb3f24d-3b61-43b4-a01e-c99cb2572f1c