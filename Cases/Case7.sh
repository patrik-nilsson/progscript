#!/bin/bash
declare mailsent=0
declare Nr=0
declare -a Usage=(`df -h | awk '{print $5}' | cut -d "%" -f 1 | sed -n '2,$p'`)
declare -a Disk=(`df -h | awk '{print $1}' | sed -n '2,$p' `)
while true; do
Nr=0
if [ $mailsent -lt 1 ]; then
	for i in "${Usage[@]}"; do
        	if [ $i -ge 90 ]; then
        		echo "${Disk[$Nr]} is exceeding 90% usage!"
        		echo "Disk usage warning. Don't forget to restart the script to get new warning mails!" | mail root -s "Disk ${Disk[$Nr]} is $i% full"
       			((mailsent++))
			fi
       	 	((Nr++))
	done
else
        for i in "${Usage[@]}"; do
                if [ $i -ge 90 ]; then
                        echo "${Disk[$Nr]} is exceeding 90% usage!"
                fi
                ((Nr++))
        done
fi
done
exit 0
