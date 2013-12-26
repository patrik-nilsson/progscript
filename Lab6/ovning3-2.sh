#!/bin/bash
function draw {
for ((i=$1;i>0;i--));do
	echo -n "*"
done 
echo
}
read -p "How long do you want the line to be? " ans
	draw $ans
exit 0
