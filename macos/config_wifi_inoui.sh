#!/bin/bash

# Mostly taken from https://github.com/vacrozet/wifi-inoui-macOSX/blob/master/wifi-sncf-inoui.sh

alldnsserver=$(cat /etc/resolv.conf| grep "nameserver" | cut -c12- | tr "\n" " ")
newsdns=$(route -n get default | grep gateway | cut -c14-)
sudo networksetup -setdnsservers Wi-Fi ${alldnsserver} ${newsdns}
sleep 2
echo "New DNS config is"
echo "$(cat /etc/resolv.conf| grep "nameserver" | cut -c12- | tr "\n" " ")"
open -a /Applications/Google\ Chrome\ Canary.app -n --args 'https://wifi.sncf/'