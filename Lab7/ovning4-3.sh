#!/bin/bash
zenity --entry \
 --title="Add user" \
 --text="New user's name" \
 --entry-text "username" \
>/tmp/username
zenity --password \
>/tmp/userpass
Name=`cat /tmp/username`
Pass=`cat /tmp/userpass`
sudo useradd -d /home/$Name -m $Name
echo $Name:$Pass | sudo chpasswd

exit 0
