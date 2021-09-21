
resource "azurerm_public_ip" "lab-Win-2019" {
  name                = "aztf-labs-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = local.region
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags                = local.common_tags
}


resource "azurerm_network_interface" "lab-Win-2019" {
  name                = "aztf-labs-nic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = local.region

  ip_configuration {
    name                          = "aztf-labs-app-ipconfig"
    subnet_id                     = azurerm_subnet.lab-public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.lab-Win-2019.id
  }

  tags = local.common_tags
}


resource "azurerm_windows_virtual_machine" "lab-Win-2019" {
  name                  = "aztf-Win2019-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = local.region
  size                  = "Standard_F2"
  network_interface_ids = [azurerm_network_interface.lab-Win-2019.id]
  admin_username        = "adminuser"
  admin_password        = "In$tig8or"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = local.common_tags
}
