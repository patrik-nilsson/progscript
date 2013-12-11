#!/bin/bash
if [ -e ./testfil ]; then
	if [ -r ./testfil ]; then
		echo "We can read the file."
	elif [ ! -r ./testfil ]; then
		echo "Cannot read the file."
	fi
elif [ ! -e ./testfil ]; then
	echo "File does not exist!"
fi
exit 0
