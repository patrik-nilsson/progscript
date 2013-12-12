#!/bin/bash
declare Nr1
declare Nr2
declare Answ
declare Rest
read -p "Number 1: " Nr1
read -p "Number 2: " Nr2
let Answ="$Nr1+$Nr2"
	echo "$Nr1 + $Nr2 = $Answ"
let Answ="$Nr1-$Nr2"
	echo "$Nr1 - $Nr2 = $Answ"
let Answ="$Nr1*$Nr2"
	echo "$Nr1 * $Nr2 = $Answ"
let Answ="$Nr1/$Nr2"
let Rest="$Nr1%$Nr2"
	echo "$Nr1 / $Nr2 = $Answ. Rest: $Rest"
exit 0
