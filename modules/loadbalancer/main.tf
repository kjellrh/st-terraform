resource "azurerm_lb" "lb" {
  name                = "student-lb"
  location            = var.location
  resource_group_name = var.resource_group_name 
  sku                 = "Basic"
  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "backend" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backend_association" {
  count                     = length(var.backend_pool_vm_nics)
  network_interface_id      = var.backend_pool_vm_nics[count.index]
  backend_address_pool_id   = azurerm_lb_backend_address_pool.backend.id
  ip_configuration_name     = "internal"
}
