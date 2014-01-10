#!/bin/bash
x=(Q Q Q Q Q Q Q Q Q)
Winner=0
playerturn=1
while [ $Winner -lt 1 ]; do
put=0
	if [ $playerturn -eq 1 ]; then
	
		while [ $put -lt 1 ]; do
		
			echo "${x[0]} | ${x[1]} | ${x[2]}"
			echo "${x[3]} | ${x[4]} | ${x[5]}"
			echo "${x[6]} | ${x[7]} | ${x[8]}"	
			echo "Where do you want to place your mark?"
			select Place in Upperleft Uppermiddle Upperright Middleleft Middle Middleright Lowerleft Lowermiddle Lowerright; do
				case $Place in
					Upperleft)
						if [ ${x[0]} != X ] & [ ${x[0]} != O ]; then
							x[0]="X"
							break
						else
							echo "This field is already marked!"
						fi
					;;
					Uppermiddle)
                                                if [ "${x[1]}" != "X" -o "${x[1]}" != "O" ]; then
                                                        x[1]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Upperright)
                                                if [ "${x[2]}" != "X" -o "${x[2]}" != "O" ]; then
                                                        x[2]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Middleleft)
                                                if [ "${x[3]}" != "X" -o "${x[3]}" != "O" ]; then
                                                        x[3]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Middle)
                                                if [ "${x[4]}" != "X" -o "${x[4]}" != "O" ]; then
                                                        x[4]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Middleright) 
                                                if [ "${x[5]}" != "X" -o "${x[5]}" != "O" ]; then
                                                        x[5]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Lowerleft)
                                                if [ "${x[6]}" != "X" -o "${x[6]}" != "O" ]; then
                                                        x[6]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Lowermiddle)
                                                if [ "${x[7]}" != "X" -o "${x[7]}" != "O" ]; then
                                                        x[7]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
					Lowerright)
                                                if [ "${x[8]}" != "X" -o "${x[8]}" != "O" ]; then
                                                        x[8]="X"
                                                        break
                                                else
                                                        echo "This field is already marked!"
                                                fi
					;;
				esac
			done

		done
		((playerturn++))

	elif [ $playerturn -eq 2 ]; then

	
		((playerturn--))

	fi

done
