#!/bin/bash
Leloop=(`cat text.txt | awk '{print $1}'`)
while true; do
	echo ${Leloop[*]}
	sleep 5
done
