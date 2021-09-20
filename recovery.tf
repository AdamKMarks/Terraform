Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # azurerm_subnet.lab-public has been deleted
  - resource "azurerm_subnet" "lab-public" {
      - address_prefix                                 = "10.0.0.0/24" -> null
      - address_prefixes                               = [
          - "10.0.0.0/24",
        ] -> null
      - enforce_private_link_endpoint_network_policies = false -> null
      - enforce_private_link_service_network_policies  = false -> null
      - id                                             = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/aztf-labs-vnetmarksak/subnets/aztf-labs-subnet-public" -> null
      - name                                           = "aztf-labs-subnet-public" -> null
      - resource_group_name                            = "myTFResourceGroup" -> null
      - virtual_network_name                           = "aztf-labs-vnetmarksak" -> null
    }
  # azurerm_subnet_network_security_group_association.lab-public has been deleted
  - resource "azurerm_subnet_network_security_group_association" "lab-public" {
      - id                        = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/aztf-labs-vnetmarksak/subnets/aztf-labs-subnet-public" -> null
      - network_security_group_id = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/networkSecurityGroups/aztf-labs-public-sgmarksak" -> null
      - subnet_id                 = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/aztf-labs-vnetmarksak/subnets/aztf-labs-subnet-public" -> null
    }
  # azurerm_virtual_network.lab has been deleted
  - resource "azurerm_virtual_network" "lab" {
      - address_space         = [
          - "10.0.0.0/16",
        ] -> null
      - dns_servers           = [] -> null
      - guid                  = "73646520-91f0-48be-b24e-89ab51774ae9" -> null
      - id                    = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/aztf-labs-vnetmarksak" -> null
      - location              = "eastus2" -> null
      - name                  = "aztf-labs-vnetmarksak" -> null
      - resource_group_name   = "myTFResourceGroup" -> null
      - subnet                = [] -> null
      - tags                  = {
          - "Environment" = "Lab"
          - "Project"     = "AZTF marksak"
        } -> null
      - vm_protection_enabled = false -> null
    }
  # azurerm_network_security_group.lab-public has been deleted
  - resource "azurerm_network_security_group" "lab-public" {
      - id                  = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/networkSecurityGroups/aztf-labs-public-sgmarksak" -> null
      - location            = "eastus2" -> null
      - name                = "aztf-labs-public-sgmarksak" -> null
      - resource_group_name = "myTFResourceGroup" -> null
      - security_rule       = [] -> null
    }
  # azurerm_subnet.lab-private has been deleted
  - resource "azurerm_subnet" "lab-private" {
      - address_prefix                                 = "10.0.1.0/24" -> null
      - address_prefixes                               = [
          - "10.0.1.0/24",
        ] -> null
      - enforce_private_link_endpoint_network_policies = false -> null
      - enforce_private_link_service_network_policies  = false -> null
      - id                                             = "/subscriptions/b0837458-adf3-41b0-a8fb-c16f9719627d/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/aztf-labs-vnetmarksak/subnets/aztf-labs-subnet-private" -> null
      - name                                           = "aztf-labs-subnet-private" -> null
      - resource_group_name                            = "myTFResourceGroup" -> null
      - virtual_network_name                           = "aztf-labs-vnetmarksak" -> null
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.
