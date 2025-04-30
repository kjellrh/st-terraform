resource "azurerm_resource_group" "main" {
  name     = "student-rg"
  location = "westeurope"
}

resource "azurerm_availability_set" "db_avset" {
  name                         = "db-availabilityset"
  location                     = azurerm_resource_group.main.location
  resource_group_name          = azurerm_resource_group.main.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}

module "network" {
  source = "./modules/network"

  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  vnet_address_space          = ["10.0.0.0/16"]
  web_subnet_address_prefix   = ["10.0.1.0/24"]
  db_subnet_address_prefix    = ["10.0.2.0/24"]
}

module "web_vm" {
  source                = "./modules/vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  subnet_id             = module.network.web_subnet_id
  vm_name               = "webserver-vm"
  public_ip             = true
}

module "db_vm1" {
  source                = "./modules/vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  subnet_id             = module.network.db_subnet_id
  vm_name               = "dbserver1"
  public_ip             = false
  availability_set_id   = azurerm_availability_set.db_avset.id
}

module "db_vm2" {
  source                = "./modules/vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  subnet_id             = module.network.db_subnet_id
  vm_name               = "dbserver2"
  public_ip             = false
  availability_set_id   = azurerm_availability_set.db_avset.id
}
