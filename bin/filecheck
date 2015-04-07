#!/bin/bash
declare File=$1
if [ -d ./$File ]; then
	echo "This is a Directory."
elif [ -h ./$File ]; then
	echo "This is a Link."
elif [ -b ./$File ]; then
	echo "This is a Block Device."
else
	echo "This is a normal File."
fi
exit 0
