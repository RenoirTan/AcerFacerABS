#!/bin/bash

# From acer-predator-turbo-and-rgb-keyboard-linux-module/install.sh

rm /dev/acer-gkbbl-0 /dev/acer-gkbbl-static-0 -f

# remove previous acer_wmi module
rmmod acer_wmi

# install required modules
modprobe wmi
modprobe sparse-keymap
modprobe video

# install facer module
insmod src/facer.ko
dmesg | tail -n 10
echo "[*] Done"
