locals {
  webserver_userdata = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
systemctl enable apache2
systemctl start apache2
echo "Hallo fra Laerdal" > /var/www/html/index.html
EOF
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip ? azurerm_public_ip.public_ip[0].id : null
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.public_ip ? 1 : 0
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_username                  = "azureuser"
  admin_password                  = "Pa$$w0rd1234!"
  disable_password_authentication = false

  availability_set_id = var.availability_set_id

  custom_data = var.vm_name == "webserver-vm" ? base64encode(local.webserver_userdata) : null

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
