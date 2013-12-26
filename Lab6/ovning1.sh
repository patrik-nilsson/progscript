#!/bin/bash
if [ $# -lt 2 ];then
	echo "$0 requires at least two arguments!"
else
	for args in $*; do
		echo "$args"
	done
fi
exit 0
