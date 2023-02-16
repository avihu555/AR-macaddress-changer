#!/bin/bash

#A script for changing mac address on your linux host.

mac=$(printf '02:%02X:%02X:%02X:%02X:%02X' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))

interfaceName=$(ifconfig | grep -o '^[^ ]*' | grep -E '^e')

interfaceName=${interfaceName::-1}

sudo ifconfig $interfaceName hw ether $mac 
sudo ifconfig $interfaceName down
sudo ifconfig $interfaceName up


echo "Your new MAC address is:   $mac"
