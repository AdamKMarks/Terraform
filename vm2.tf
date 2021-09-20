# Create a new Virtual Machine based on the Golden Image
resource "azurerm_image" "vm" {
  name                             = "AZLXDEVOPS01"
  location                         = local.region
  resource_group_name              = azurerm_resource_group.rg.name
  source_virtual_machine_id        = "/subscriptions/ed5e2254-5d87-4255-b70e-1b5eba509f73/resourceGroups/app-imagegallery-prod-eastus2/providers/Microsoft.Compute/images/Windows2019-DC-LTS-daily-1618388082"
}
