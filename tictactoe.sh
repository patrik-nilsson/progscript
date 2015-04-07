#!/bin/bash
function place {
	if [ "${x[y]}" != "X" -a "${x[y]}" != "O" ]; then
		if [ $playerturn -eq 1 ]; then
			player="X"
			x[y]=$player
			((put++))
			break
		else
			player="O"
			x[y]=$player
			((put++))
			break
		fi
	else
		echo "This field is already marked!"
	fi
}
#function gameover {
#	if [ y -lt 4 ]; then
#		if +3 and +6 is $player
#	elif [ y -gt 6 ]; then
#		if -3 and -6 is $player
#	else
#		if -3 and +3 is $player
#	fi
#}
x=(" " " " " " " " " " " " " " " " " ")
Winner=0
playerturn=1
while [ $Winner -lt 1 ]; do
put=0
	while [ $put -lt 1 ]; do
		echo $playerturn	
		echo "${x[0]} | ${x[1]} | ${x[2]}"
		echo "${x[3]} | ${x[4]} | ${x[5]}"
		echo "${x[6]} | ${x[7]} | ${x[8]}"	
		echo "Where do you want to place your mark?"
		select Place in Upperleft Uppermiddle Upperright Middleleft Middle Middleright Lowerleft Lowermiddle Lowerright; do
			case $Place in
				Upperleft)
					y=0
					place
				;;
				Uppermiddle)
					y=1
					place
				;;
				Upperright)
					y=2
					place
				;;
				Middleleft)
					y=3
					place
				;;
				Middle)
					y=4
					place
				;;
				Middleright) 
					y=5
					place
				;;
				Lowerleft)
					y=6
					place
				;;
				Lowermiddle)
					y=7
					place
				;;
				Lowerright)
					y=8
					place
				;;
			esac
		done
	done
	if [ $playerturn -lt 2 ]; then
		((playerturn++))
	elif [ $playerturn -eq 2 ]; then
		((playerturn--))
	fi
done
