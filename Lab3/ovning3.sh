#!/bin/bash
read -p "Write a number from 1 to 10: " Nr
if [ $Nr -gt 10 ] || [ $Nr -lt 1 ]; then
	echo "That's not a number from 1 to 10, dumbass!"
else
	echo "Thank you."
fi
exit 0
