#!/bin/bash
if [ ! -e ./testfil -o ! -w ./testfil ]; then
	echo "File does not exist or cannot be written to."
	exit 1
fi
exit 0
