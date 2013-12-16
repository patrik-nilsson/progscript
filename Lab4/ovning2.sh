#!/bin/bash
declare Answ="N"
declare Amm
declare Sum
while true; 
#As long as the answer is wrong, it will keep asking for an answer.
do
	read -p "Do you want to convert from Kronor or Dollar? (k/d) " Answ
	if [ "$Answ" = "K" ] || [ "$Answ" = "k" ]; then #If answer is k or K
		read -p "How many Kronor: " Amm
		Sum=$(bc -l <<< "scale=2; $Amm/7") #Convert Kronor to Dollar
		echo "$Amm Kronor is $Sum Dollar."
		break
	elif [ "$Answ" = "D" ] || [ "$Answ" = "d" ]; then #If answer is D or d
		read -p "How many Dollar: " Amm
		Sum=$(bc -l <<< "scale=2; $Amm*7")  #Convert Dollar to Kronor
		echo "$Amm Dollar is $Sum Kronor."
		break
	else
		echo "Wrong input." #If the answer was wrong, show this message and repeat.
	fi #End of If
done #End of Loop
exit 0
