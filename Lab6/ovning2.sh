#!/bin/bash
dir=/tmp/importantfiles
if [ $EUID -eq 0 ];then
	if [ -e $dir ];then
		if [ -w $dir ];then
			for file in `ls $dir`; do
				if [ ! -w "$dir/$file" ];then
					echo "$file isn't writable!"
					exit 1
				fi	
			done
			rm -rf $dir/*	
		else
			echo "Script cannot write to $dir!"
		fi
	else
		echo "$dir doesn't exist!"
		exit 1
	fi
else
	echo "You need to be root to run this script!"
	exit 1
fi
exit 0
