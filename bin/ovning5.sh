#!/bin/bash
declare Cho=$1
if [ -e $HOME/$Cho.tar.gz ]; then
	echo "A backup with that name already exists!"
	exit 1
elif [ -w $HOME ]; then
	for i in `ls $Cho`; do
		if [ ! -r $i ]; then
			echo "$i wasn't readable."
			exit 1
		fi
	done
	tar -czpf $Cho.tar.gz $Cho
fi
exit 0
