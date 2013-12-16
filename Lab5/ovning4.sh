#!/bin/bash
declare Sum

for Line in `cat grades.txt`; do
	Sum=$[$Sum+$Line]	
done
	echo "$Sum"
	if [ $Sum -lt 30 ]; then
		echo "IG"
	elif [ $Sum -lt 48 ]; then
		echo "G"
	else
		echo "VG"
	fi
exit 0
