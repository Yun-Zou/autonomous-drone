#!/bin/bash
# Installs the Intel Realsense library librealsense on a Jetson Nano Development Kit
# The installation is from a RealSense Debian repository
# Copyright (c) 2016-19 Jetsonhacks 
# MIT License
# https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md
# Register the server's public key:

# Based on Jetson Hacks installLibrealsense repo
# https://github.com/JetsonHacksNano/installLibrealsense

# Release vL4T32.3.1
# Jetson Nano
# L4T 32.3.1, JetPack 4.3, Kernel 4.9.
# Also works with L4T 32.2.1 - 32.2.3
# Current  librealsense version v2.31.0
# Fixed Issue: D435i and T265 have issues working together. Upgrading D435i firmware fixes this issue.
# Requires realsense-ros version 2.2.11 

sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 

# Ubuntu 18 is bionic
sudo add-apt-repository "deb http://librealsense.intel.com/Debian/apt-repo bionic main" -u

sudo apt-get install apt-utils -y
sudo apt-get install librealsense2-utils librealsense2-dev -y

