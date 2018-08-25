#! /bin/bash

loc=${1:-"eastus"}

echo "checking usage in $loc"

az vm list-usage --output table --location $loc 
