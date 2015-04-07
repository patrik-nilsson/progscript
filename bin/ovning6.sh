#!/bin/bash

if [ ! -e /tmp/importantfiles ];then
	mkdir /tmp/importantfiles
fi
#if [ $EUID -eq 0 ]; then
	scp lyite@172.24.100.69:~/importantfiles/* /tmp/importantfiles
	if [ $? -eq 0 ]; then
		echo "File has been transferred from the server."
		cd /tmp
		tar -czpf $HOME/backups/backup.tar.gz importantfiles
		if [ $? -eq 0 ]; then
			echo "Backup was successfully made."
		else
			echo "An error occured while backing up!"
		fi
	else
		echo "An error occurred while transferring the files!"
	fi
#else
#	echo "You do not have root rights!"
#fi
exit 0
