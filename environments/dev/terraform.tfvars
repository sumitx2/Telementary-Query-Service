rgp ={
    rg1={
        name="axion"
        location ="centralindia"
    }
}

vnetsp ={
    vnet1={
        name="axion-vnet"
        location="centralindia"
        rgname ="axion"
        address_space=["10.0.0.0/16"]
    }
}

subnetsp = {
    subnet1 ={
        name = "frontend-subnet"
        resource_group_name ="axion"
        virtual_network_name ="axion-vnet"
        address_prefixes= ["10.0.1.0/24"]
    }
    subnet2 ={
        name="backend-subnet"
        resource_group_name ="axion"
        virtual_network_name ="axion-vnet"
        address_prefixes= ["10.0.2.0/24"]
    }
    subnet3 ={
        name="database-subnet"
        resource_group_name ="Axion"
        virtual_network_name ="axion-vnet"
        address_prefixes= ["10.0.3.0/24"]
    }
}


vmp = {
    vm1={
        vm_name = "axion-frontend-vm"
        nic_name = "nic-frontend"
        location = "centralindia"
        resource_group_name="axion"
        subnet_name="frontend-subnet"
        virtual_network_name="axion-vnet"
        pip_name="pip1"
    }
     vm2={
        vm_name = "axion-backend-vm"
        nic_name = "nic-backend"
        location = "centralindia"
        resource_group_name="axion"
        subnet_name="backend-subnet"
        virtual_network_name="axion-vnet"
        pip_name="pip2"
    }

}

pipp = {
    pip1 ={
    public_ip_name = "pip1"
  resource_group_name="axion"
  location ="centralindia"
  allocation_method = "Static"
}
 pip2 ={
    public_ip_name = "pip2"
  resource_group_name="axion"
  location ="centralindia"
  allocation_method = "Static"
}
pip3 ={
    public_ip_name = "pip3"
  resource_group_name="axion"
  location ="centralindia"
  allocation_method = "Static"
}
}



