data "azurerm_resource_group" "compute" {
  name     = "compute"
}

data "azurerm_resource_group" "networking" {
  name     = "networking"
}

data "azurerm_resource_group" "security" {
  name     = "security"
}

data "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = "networking"
}

data "azurerm_subnet" "subnet4" {
  name                    = "subnet4"
  resource_group_name     = "networking"
  virtual_network_name    = data.azurerm_virtual_network.vnet1.name
}

data "http" "myPublicIp" {
  url = "https://ifconfig.co/json"
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  ifconfig_co_json = jsondecode(data.http.myPublicIp.body)
}



# Create public IPs
resource "azurerm_public_ip" "cjptest_ip01" {
    name                         = "cjptest_ip01"
    location                     = "uksouth"
    resource_group_name          = data.azurerm_resource_group.compute.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Test"
    }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "cjptest_nsg01" {
    name                = "cjptest_nsg01"
    location            = "uksouth"
    resource_group_name = data.azurerm_resource_group.security.name

    security_rule {
        name                       = "RDP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "82.12.247.77" #"${local.ifconfig_co_json.ip}/32"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Test"
    }
}

# Create network interface
resource "azurerm_network_interface" "cjptest_vm01_nic" {
    name                      = "cjptest_vm01_nic"
    location                  = "uksouth"
    resource_group_name       = data.azurerm_resource_group.compute.name

    ip_configuration {
        name                          = "cjptest_nicConfig01"
        subnet_id                     = data.azurerm_subnet.subnet4.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.cjptest_ip01.id
    }

    tags = {
        environment = "Test"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "cjptest01_nic_nsg_assoc01" {
    network_interface_id      = azurerm_network_interface.cjptest_vm01_nic.id
    network_security_group_id = azurerm_network_security_group.cjptest_nsg01.id
}

# Create virtual machine
resource "azurerm_virtual_machine" "cjptest_vm01" {
    name                  = "cjptest_vm01"
    location              = "uksouth"
    resource_group_name   = data.azurerm_resource_group.compute.name
    network_interface_ids = [azurerm_network_interface.cjptest_vm01_nic.id]
    vm_size               = "Standard_B1s"

    delete_os_disk_on_termination     = true
    delete_data_disks_on_termination  = true

    storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2012-r2-datacenter-gensecond"
    version   = "latest"
  }

  storage_os_disk {
    name              = "cjptest_vm01_osDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "nobodynose"
    admin_password = "4&E%$Um'V(gqx6LW"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true

  }

    tags = {
        environment = "Test"
    }
}

output "my_ip_addr" {
  value = local.ifconfig_co_json.ip
}

output "vm_ip_addr" {
  value = azurerm_public_ip.cjptest_ip01.ip_address
}

/*
module "vm" {
  source        = "../modules/vm"
  vm_subnet_id  = azurerm_subnet.subnet1.id
}


output "publicIp" {
  description = "The public IP address is: "
  value       = azurerm+public_ip
}
*/