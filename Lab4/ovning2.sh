#!/bin/bash
declare Answ="N"
declare Amm
declare Sum
while [ "$Answ" != "K" -a $Answ != "k" -a $Answ != "D" -a $Answ != "d" ] 
do
	read -p "Do you want to convert from Kronor or Dollar? (k/d) " Answ
	if [ $Answ = K ] || [ $Answ = k ]; then
		read -p "How many Kronor: " Amm
		let Sum="$Amm/7"
		echo "$Amm Kronor is $Sum Dollar."
	elif [ $Answ = D ] || [ $Answ = d ]; then
		read -p "How many Dollar: " Amm
		let Sum="$Amm*7"
		echo "$Amm Dollar is $Sum Kronor."
	else
		echo "Wrong input."
	fi
done
exit 0
