#!/bin/sh

# Based on Jetson Hacks installRealsenseRos
# https://github.com/jetsonhacks/installRealSenseROS

# The script 'disableAutosuspend.sh' simply turns off the USB autosuspend setting on the Jetson so that the camera is always available. 
# Disable USB autosuspend
sudo sed -i '$s/$/ usbcore.autosuspend=-1/'  /boot/extlinux/extlinux.conf
# /bin/ required for echo to work correctly in /bin/sh file
/bin/echo -e "\e[1;32mPlease reboot for changes to take effect.\e[0m"

