#!/bin/bash
#Update system apt-get
sudo apt-get update && sudo apt-get upgrade

#make it possible to run 32-bit software
sudo apt-get install --reinstall libc6-i386
sudo apt-get install libgl1-mesa-glx:i386 lsb-core

#install olow_DS9097U_org dependancy
sudo apt-get install liblockdev1-dbg:i386

exit 0
