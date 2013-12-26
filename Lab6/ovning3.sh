#!/bin/bash
if [ $# -gt 1 -o $# -lt 1 ]; then
	echo "Please write one argument."
else
	for ((i=$1;i>0;i--));do
		echo -n "*"
	done
	echo ""
fi
exit 0
