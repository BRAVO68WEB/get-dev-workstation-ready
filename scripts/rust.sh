# Check if the script is being run by root or not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installed Rust"