#!/bin/bash

# Check if the script is being run by root or not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing Golang \n"

brew install go

echo "Installed Golang"