# Locate the existing custom/golden image
data "azurerm_image" "search" {
  name                = "Windows2019-DC-LTS-daily-1618388082"
  resource_group_name = "app-imagegallery-prod-eastus2"
}

output "image_id" {
  value = "/subscriptions/ed5e2254-5d87-4255-b70e-1b5eba509f73/resourceGroups/app-imagegallery-prod-eastus2/providers/Microsoft.Compute/images/Windows2019-DC-LTS-daily-1618388082"
}

  # Create a new Virtual Machine based on the Golden Image
resource "azurerm_virtual_machine" "vm" {
  name                             = "AZLXDEVOPS01"
  location                         = local.region
  resource_group_name              = "myTFResourceGroup"
  network_interface_ids            = ["azurerm_subnet.lab-public.id"]
  vm_size                          = "Standard_DS12_v2"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "${data.azurerm_image.search.id}"
  }

  storage_os_disk {
    name              = "AZLXDEVOPS01-OS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
}

  os_profile {
    computer_name  = "APPVM"
    admin_username = "admin"
    admin_password = "in$tig8or"
  }
}
