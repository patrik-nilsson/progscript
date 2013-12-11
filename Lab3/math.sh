#!/bin/bash
Nr1=10
Nr2=10
if [ "$Nr1" -eq "$Nr2" ]; then
	echo "Number1 is equal to Number2."
elif [ "$Nr1" -ne "$Nr2" ]; then
	echo "Number1 is not equal to Number2."
fi
exit 0
