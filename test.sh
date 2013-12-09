#!/bin/bash 
x=1
echo 'Vi räknar till tio!'
for (( i=1;i<=10;i++ ))
do
	echo "x=$x"
	echo "i=$i"
	x=$(($i * $x))
	echo -e "$x"
done
exit 0
