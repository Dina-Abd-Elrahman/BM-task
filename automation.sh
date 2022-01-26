#!/bin/bash
# Title          : automation.sh
# Description    : Checking if virtualBox and Vagrant are instaled, and start vagrant file
# Author         : Dina Abd El-rahman
# Example        :# bash automation.sh


# Function to check if a package installed
function pkg_check
{
  package_name=$1
  if $(dpkg -l | grep -i "${package_name}" >/dev/null)
  then
    echo "[+] ${package_name} already installed"
  else
    echo "[-] Can't detect ${package_name} "
    echo "[*] Start installing ${package_name}"
    sudo apt install ${package_name} -y || { echo "[-] Can't install ${package_name}, please check"; exit 1; }
    echo "[+] ${package_name} installed"
  fi

}

## Check if virtualbox is installed
echo "============================="
echo "Check VirtualBox installation"
echo "============================="

pkg_check virtualbox

## Check if vagrant is installed
echo "============================="
echo "Check vagrant installation"
echo "============================="
pkg_check vagrant

## Install vagrant-docker-compose plugin
echo "====================================="
echo "Install vagrant-docker-compose plugin"
echo "====================================="
vagrant plugin install vagrant-docker-compose

## Run vagrant file
vagrant up

## Access you environment succefully
echo "Go to your browser, and check this url http://127.0.0.1:9001, Username: test, password: test12345"
