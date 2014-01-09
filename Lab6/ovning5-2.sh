#!/bin/bash
declare Nr=0
declare -a Usage=(`df -h | awk '{print $5}' | cut -d "%" -f 1 | sed -n '2,$p'`)
declare -a Disk=(`df -h | awk '{print $1}' | sed -n '2,$p' `)
for i in "${Usage[@]}"; do
	if [ $i -gt 80 ]; then
	#sudo mailx -s "${Disk[$Nr]} is exceeding 80% usage!" < /dev/null "kook577@hotmail.com"
	#sudo mail -s "Usage Warning!" kook577@hotmail.com <<< "${Disk[$Nr]} is exceeding 80% usage!"
	echo "${Disk[$Nr]} is exceeding 80% usage!"
	echo "Disk ${Disk[$Nr]} is $i% full" | mail patrik -s "Disk usage warning"
	fi
	((Nr++))
done
exit 0
