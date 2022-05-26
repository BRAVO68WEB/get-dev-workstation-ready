#!/bin/sh

# Check if the script is being run by root or not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo  "Installing Python..."

brew install python3

echo   "Installed Pip"

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.

echo "Installed Python and Pip"

