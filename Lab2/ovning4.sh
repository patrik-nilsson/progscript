#!/bin/bash
declare Colour
read -t 5 -p "What is your favorite colour? " Colour #Asks for your favorite colour.
Colour=${Colour:="Red"} #If no colour was decided, (If colour=NULL) the Colour wil be red.
echo -e "\nYour favorite Colour is: $Colour." #Prints on a new row what your favorite Colour is.
