#!/bin/bash
declare -a Host
declare Nr
declare Leloop=`cat hosts | awk '{print $2}'`
while true; do
	Nr=0
	printf "%10s" "HOSTNAME"
	printf "%20.20s" "IP"
	printf "%10.10s\n" "STATUS"
	echo "-------------------------------------------"
	for i in $Leloop; do
		ping -c 1 -w 1 $i >/dev/null
		Host[$Nr]=$?
		if [ ${Host[$Nr]} -gt 0 ]; then
			printf "%10s" "Host$(($Nr+1))"
			printf "%20.20s" "$i"
			printf "\e[1;31m%10.10s\n\e[0m" "DOWN"
		else
			printf "%10s" "Host$(($Nr+1))"
			printf "%20.20s" "$i"
			printf "\e[1;32m%10.10s\n\e[0m" "UP"
		fi
		((Nr++))
	done
	sleep 5
	clear
done
exit 0
