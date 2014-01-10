#!/bin/bash
if [ $UID -ne 0 ]; then
	dialog --backtitle "ERROR" --msgbox "You need to be ROOT to run this script!" 10 60
	clear
	exit 1
else
function Add {
	dialog --title "Adding User" --inputbox "New user's name: " 10 60 2>/tmp/username
	dialog --passwordbox "New user's password: " 10 60 2>/tmp/userpass
	Name=`cat /tmp/username`
	Pass=`cat /tmp/userpass`
	for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $1 }'`; do
	if [ "$i" = "$Name" ]; then
		dialog --backtitle "ERROR" --title "ERROR" --msgbox "$Name is already an existing user!" 10 60
		clear
		exit 1
	fi
	done
	for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $6 }'`; do
	if [ "$i" = "/home/$Name" ]; then
		dialog --backtitle "ERROR" --title "ERROR" --msgbox "Home directory /home/$Name already exists!" 10 60
		clear
		exit 1
	fi
	done
	sudo useradd -d /home/$Name -m $Name
	echo $Name:$Pass | sudo chpasswd
	dialog --backtitle "Done" --title "User add" --msgbox "User $Name has been added!" 10 60
	Quit
}
function Remove {
	dialog --title "Remove User" --inputbox "Name of user to remove: " 10 60 2>/tmp/remuser
	Name=`cat /tmp/remuser`
	sudo userdel -r $Name
	if [ $? -lt 1 ]; then
		dialog --backtitle "Done" --title "User removal" --msgbox "User has been removed!" 10 60
		Quit
	else
		dialog --backtitle "ERROR" --title "ERROR" --msgbox "That user doesn't exist!" 10 60
		Quit
	fi
}
function Lock {
        dialog --title "Locking User" --inputbox "Account to lock: " 10 60 2>/tmp/username
        Name=`cat /tmp/username`
        for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $1 }'`; do
        if [ "$i" = "$Name" ]; then
		sudo usermod -L $Name
        	dialog --backtitle "Done" --title "User Lock" --msgbox "Account $Name has been Locked!" 10 60
        	Quit
        fi
        done
	dialog --backtitle "ERROR" --title "ERROR" --msgbox "$Name doesn't exist!" 10 60
        clear
        exit 1
}
function Unlock {
        dialog --title "Unlocking User" --inputbox "Account to unlock: " 10 60 2>/tmp/username
        Name=`cat /tmp/username`
        for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $1 }'`; do
        if [ "$i" = "$Name" ]; then
                sudo usermod -U $Name
                dialog --backtitle "Done" --title "User Unlock" --msgbox "Account $Name has been Unlocked!" 10 60
                Quit
        fi
        done
        dialog --backtitle "ERROR" --title "ERROR" --msgbox "$Name doesn't exist!" 10 60
        clear
        exit 1

}
function Password {
        dialog --title "Changing Password" --inputbox "Change password for user: " 10 60 2>/tmp/username
        dialog --passwordbox "New password: " 10 60 2>/tmp/userpass
        Name=`cat /tmp/username`
        Pass=`cat /tmp/userpass`
        for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $1 }'`; do
        if [ "$i" = "$Name" ]; then
       	        echo $Name:$Pass | sudo chpasswd
       		dialog --backtitle "Done" --title "Password Change" --msgbox "User $Name password has been changed!" 10 60
        	Quit
	fi
        done
        dialog --backtitle "ERROR" --title "ERROR" --msgbox "$Name is not an existing user!" 10 60
        clear
        exit 1
}
function Shell {
        dialog --title "Changing Shell" --inputbox "Change Shell for user: " 10 60 2>/tmp/username
        dialog --title "Changing SHell" --menu "Choose a shell" 30 80 6 /bin/sh "Shell" /bin/dash "Dash" /bin/bash "Bash" /bin/rbash "rBash" /usr/bin/screen "Screen" Cancel "Cancel shell change." 2> /tmp/Shellchoice
        Name=`cat /tmp/username`
	Shell=`cat /tmp/Shellchoice`
        if [ "$Shell" = "Cancel" ]; then
		Quit
	fi
	for i in `cat /etc/passwd | awk 'BEGIN { FS = ":" } ; { print $1 }'`; do
        if [ "$i" = "$Name" ]; then
                sudo usermod -s $Shell $Name
                dialog --backtitle "Done" --title "Shell Change" --msgbox "User $Name Shell has been changed to $Shell!" 10 60
                Quit
        fi
        done
        dialog --backtitle "ERROR" --title "ERROR" --msgbox "$Name is not an existing user!" 10 60
        clear
        exit 1
        dialog --menu "Choose a shell" 30 80 6 /bin/sh "Shell" /bin/dash "Dash" /bin/bash "Bash" /bin/rbash "rBash" /usr/bin/screen "Screen" Cancel "Cancel shell change." 2> /tmp/Shellchoice

}
function Quit {
	dialog --backtitle "Exiting" --msgbox "Good bye!" 5 20 
	clear
	exit 0
}
	dialog --menu "Choose your action" 30 80 7 Add "Add a new user." Remove "Remove an old user." Lock "Lock a user from logging in." Unlock "Unlock a locked user." Password "Change password of a user." Shell "Change shell of a user." Quit "Exit this menu." 2> /tmp/Usermanager
Choice=`cat /tmp/Usermanager`
$Choice
fi
clear
exit 0
