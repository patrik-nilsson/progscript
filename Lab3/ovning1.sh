#!/bin/bash
declare Nr1
declare Nr2
read -p "Write in a number: " Nr1
read -p "And another number: " Nr2
if [ "$Nr1" -eq "$Nr2" ]; then
	echo "The first number ($Nr1) is equal to the second number ($Nr2)."
elif [ "$Nr1" -ne "$Nr2" ]; then
	echo "The first number ($Nr1) is not equal to the second number ($Nr2)."
	if [ "$Nr1" -gt "$Nr2" ]; then
		echo "The first number ($Nr1) is greater than the second number ($Nr2)."
	elif [ "$Nr1" -lt "$Nr2" ]; then
		echo "The first number ($Nr1) is less than the second number ($Nr2)."
	fi
fi
exit 0
