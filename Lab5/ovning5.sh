#!/bin/bashd
declare Cho=$1
if [ -e $HOME/$Cho ]; then
	echo "A backup with that name already exists!"
	exit 1
elif [ -w $HOME ]; then
	for i in `cat $Cho/$1`; do
		if [ ! -r $1 ]; then
			echo "A file in the directory isn't readable!"
			exit 1
		fi
	done
	tar $Cho
	echo "Backup was made! (1/2)"
else
	echo "Script cannot write to $HOME."
	exit 1
fi
echo "A backup has been made! (2/2)"
exit 0
