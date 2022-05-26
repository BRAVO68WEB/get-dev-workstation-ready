#!/bin/bash

echo  "Hello, world! You are using get-dev-workstation-ready script to get a dev workstation ready."

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

start=${1:-"start"}

jumpto $start

start:
echo "Checking dependencies"
# Check if the script is being run by root or not
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
hash curl 2>/dev/null || { echo >&2 "curl not installed.  Aborting."; exit 1; }
hash git 2>/dev/null || { echo >&2 "git not installed.  Aborting."; exit 1; }
hash wget 2>/dev/null || { echo >&2 "wget not installed.  Aborting."; exit 1; }
hash brew 2>/dev/null || { echo >&2 "brew not installed.  Aborting."; exit 1; }

install-1:
echo "Do you want to install nodejs? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/nodejs.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-2
else
    jumpto install-1
fi

install-2:
echo "Do you want to install rust? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/rust.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-3
else
    jumpto install-2
fi

install-3:
echo "Do you want to install go? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/go.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-4
else
    jumpto install-3
fi

install-4:
echo "Do you want to install python? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/python.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-5
else
    jumpto install-4
fi

install-5:
echo "Do you want to install gcc? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/gcc.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-6
else
    jumpto install-5
fi

install-6:
echo "Do you want to install docker? y/n"
read ques

if [[ $ques = "y" ]]
then
    bash scripts/docker.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto install-7
else
    jumpto install-6
fi

install-7:
echo "Do you want to install other softwares? y/n"
read ques

if  [[ $ques = "y" ]]
then
    bash scripts/softwares.sh
elif [[ $ques = "n" ]]
then
    echo "Skiping !!"
    jumpto exit-script
else
    jumpto exit-script
fi

exit-script:
echo "All Done !!"
exit 0