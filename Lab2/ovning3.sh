#!/bin/bash
read -p "Add a name to names.txt: " Namn #Asks for a name to add.
echo $Namn >> names.txt
#Sends the stdout into the file names.txt, without removing old information from the file.
exit 0
