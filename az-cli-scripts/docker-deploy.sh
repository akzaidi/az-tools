#!/bin/bash

rg=${1:-azrgdocker}
loc=${2:-westus}
vmname=${3:-azdocker}

# Create a resource group.
az group create --name $rg --location $loc 

# Create a new virtual machine, this creates SSH keys if not present.
az vm create --resource-group $rg --name $vmname --image UbuntuLTS 

# Open port 80 to allow web traffic to host.
  az vm open-port --port 80 --resource-group myResourceGroup --name myVM

# Install Docker and start container.
az vm extension set \
  --resource-group myResourceGroup \
  --vm-name myVM \
  --name DockerExtension \
  --publisher Microsoft.Azure.Extensions \
  --version 1.1 \
  --settings '{"docker": {"port": "2375"},"compose": {"web": {"image": "nginx","ports": ["80:80"]}}}'
