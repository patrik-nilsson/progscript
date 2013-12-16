#!/bin/bash
read -p "Write a number from 10 to 100: " Tal
if [[ $Tal != *[!0-9]* ]]; then #Makes sure there's no string
	if [ $Tal -lt 10 -o $Tal -gt 100 ]; then
		echo "I said from 10 to 100..."
		exit 1
	else 
		until [ $Tal = 0 ]; do
			echo "$Tal"
			((Tal--))
		done
	fi
else
	echo "That's not even a bloody number!"
	exit 1
fi
exit 0
