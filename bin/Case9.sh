#!bin/bash
if [ ! -e hosts ]; then
	echo "hosts file doesn't exist!"
	echo "Please create a file named 'hosts' and follow this example:"
        echo "Host1	192.168.100.100		index.html"
        echo "Host2	172.24.200.200		sub/help.html"
	exit 0
fi
declare -a Host
declare -a Www
declare Nr
declare Jump=0
declare -a Leloop=(`cat hosts | awk '{print $1}'`)
declare -a Ping=(`cat hosts | awk '{print $2}'`)
declare -a Wget=(`cat hosts | awk '{print $3}'`)
clear
while true; do
	Leloop=(`cat hosts | awk '{print $1}'`)
	Ping=(`cat hosts | awk '{print $2}'`)
	Wget=(`cat hosts | awk '{print $3}'`)
	Jumpcheck=0
	Nr=0

	if [ $Jumpcheck -lt 1 ]; then echo -en "\e["$Jump"A"; fi
	printf "%10s" "HOSTNAME"
	printf "%20.20s" "IP"
	printf "%10.10s" "STATUS"
	printf "%10.10s\n" "WWW"
	echo "------------------------------------------------------"
	for i in ${!Leloop[*]}; do

		ping -c 1 -w 1 ${Ping[$i]} &>/dev/null
		Host[$Nr]=$?
		wget -T 1 -t 1 -4 ${Ping[$i]}/${Wget[$i]} &>/dev/null
		Www[$Nr]=$?
		if [ ${Host[$Nr]} -gt 0 ]; then
			printf "\r%10s" "$(($Nr+1)):${Leloop[$i]}"
			printf "%20.20s" "${Ping[$i]}"
			printf "\e[1;31m%10.10s\e[0m" "DOWN"
		else
			printf "\r%10s" "$(($Nr+1)):${Leloop[$i]}"
			printf "%20.20s" "${Ping[$i]}"
			printf "\e[1;32m%10.10s\e[0m" "UP"
		fi
		if [ ${Www[$Nr]} -gt 0 ]; then
			printf "%10.10s\n" "DOWN"
		else
			printf "%10.10s\n" "UP"
		fi
		((Nr++))
		((Jumpcheck++))
		if [ -e ${Wget[$i]} ]; then
			rm -rf ${Wget[$i]}
		fi
	done
	Jump=$((${#Leloop[*]} + 3))
	echo "------------------------------------------------------"
	sleep 5
	#clear
done
exit 0
