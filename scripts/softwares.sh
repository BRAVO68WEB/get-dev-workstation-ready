#!/bin/bash

# Check if the script is being run by root or not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

brew install --cask visual-studio-code

brew install --cask spotify

brew install --cask postman

brew install --cask brave-browser