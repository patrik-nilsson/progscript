#!/bin/bash
if [ ! -e ./recept.txt ]; then #If file doesn't exist
	echo	"Recept.txt doesn't exist!"
	exit 1 #Quit script with error.
elif [ ! -r ./recept.txt ]; then #If file exists, but isn't readable
	echo "Recept.txt isn't readable!"
	exit 1 #Quit script with error..
elif [ ! -w ./recept.txt ]; then #If file exists, can be read but cannot be written to
	echo "Recept.txt cannot be written to." 
	read -p "Open anyway? (y/n)" Answ #Ask if the user wants to read it.
	if [ $Answ = "y" ] || [ $Answ = "Y" ]; then #If yes
		vim recept.txt #Open file.
	else 		#If not
		exit 1  #Then quit with error.
	fi
else #If file exist, is readable and writeable
vim recept.txt #Open file.
fi
exit 0
