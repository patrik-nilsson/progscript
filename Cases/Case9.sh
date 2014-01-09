#!/bin/bash
if [ ! -e hosts ]; then
	echo "hosts file doesn't exist!"
	exit 0
fi
declare -a Host
declare -a Www
declare Nr
declare -a Leloop=(`cat hosts | awk '{print $1}'`)
declare -a Ping=(`cat hosts | awk '{print $2}'`)
declare -a Wget=(`cat hosts | awk '{print $3}'`)
while true; do
	Nr=0
	printf "%10s" "HOSTNAME"
	printf "%20.20s" "IP"
	printf "%10.10s" "STATUS"
	printf "%10.10s\n" "WWW"
	echo "------------------------------------------------------"
	for i in ${!Leloop[*]}; do

		ping -c 1 -w 1 ${Ping[$i]} >/dev/null
		Host[$Nr]=$?
		wget -T 1 -t 1 -4 ${Ping[$i]}/${Wget[$i]} &>/dev/null
		Www[$Nr]=$?
		if [ ${Host[$Nr]} -gt 0 ]; then
			printf "%10s" "$(($Nr+1)):${Leloop[$i]}"
			printf "%20.20s" "${Ping[$i]}"
			printf "\e[1;31m%10.10s\e[0m" "DOWN"
		else
			printf "%10s" "$(($Nr+1)):${Leloop[$i]}"
			printf "%20.20s" "${Ping[$i]}"
			printf "\e[1;32m%10.10s\e[0m" "UP"
		fi
		if [ ${Www[$Nr]} -gt 0 ]; then
			printf "%10.10s\n" "DOWN"
		else
			printf "%10.10s\n" "UP"
		fi
		((Nr++))
		if [ -e ${Wget[$i]} ]; then
			rm -rf ${Wget[$i]}
		fi
	done
	sleep 5
	clear
done
exit 0
