#!/bin/bash
#I don't understand how to do this...
	#declare -a Disk 
	#declare -a Usage
	#for ((i=0;i<
df -h | awk '{print $5}' | cut -d "%" -f 1 > /tmp/usage
for i in `cat /tmp/usage`; do
	if [ $i -gt 80 ]; then 
		echo "A disk is exceeding 80%!"
	fi
done
exit 0
