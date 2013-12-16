#!/bin/bash
#This task has a case solution.
declare Answ="N"
declare Amm
declare Sum
while [ "$Answ" != "K" -a $Answ != "k" -a $Answ != "D" -a $Answ != "d" ] 
#As long as the answer is wrong, it will keep asking for an answer.
do
	read -p "Do you want to convert from Kronor or Dollar? (k/d) " Answ
	case $Answ in
	[Kk] )	#If answer is K or k
		read -p "How many Kronor: " Amm
		let Sum="$Amm/7" #Convert Kronor to Dollar
		echo "$Amm Kronor is $Sum Dollar."
	;;	
	[Dd] )	#If answer is D or d	
		read -p "How many Dollar: " Amm
		let Sum="$Amm*7" #Convert Dollar to Kronor
		echo "$Amm Dollar is $Sum Kronor."
	;;
	* ) #If the answer is anything but the above
		echo "Wrong input."
	;;
	esac #Case closed.
done #Loop closed.
exit 0
