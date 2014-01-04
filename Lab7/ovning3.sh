#!/bin/bash
dialog --inputbox "New user's name: " 10 60 2>/tmp/username
dialog --passwordbox "New user's password: " 10 60 2>/tmp/userpass
Name=`cat /tmp/username`
Pass=`cat /tmp/userpass`
sudo useradd -d /home/$Name -m $Name
echo $Name:$Pass | sudo chpasswd

exit 0
