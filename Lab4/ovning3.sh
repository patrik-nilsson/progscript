#!/bin/bash #Den slutar inte fråga efter PIN.
declare Pass
declare -a Cho[10]
declare Fail=0
declare Withd
declare Depo
declare Total=5000
declare Pocket=100
while [ "${Cho[0]}" != "I" -a "${Cho[0]}" != "i" ]
do
	#Display start.
	echo "____________________"
	echo "|Welcome to the ATM|"
	echo "|[I]nset card      |"
	echo "|[E]xit            |"
	echo "|__________________|"
	read Cho[0]

	if [ "${Cho[0]}" = "I" -o "${Cho[0]}" = "i" ]; then #Card inserted
		while true;
		do
			echo "____________________"
			echo "|Insert your pin:  |"
			echo "| - - - -          |"
			echo "|__________________|"
			read Pass
			if [ $Pass = 9999 ]; then
				echo "____________________"
				echo "|Welcome $USER! <<<"
				echo "|[W]ithdraw        |"
				echo "|[D]eposit         |"
				echo "|[C]heck saldo     |"
				echo "|[E]xit            |"
				echo "|__________________|"
				read Cho[1]
				case ${Cho[1]} in
				W|w)
					read -p "How much do you want to withdraw? " Withd
					if [[ $Withd != *[!0-9]* ]]; then #Makes sure there's no string
						if [ $Withd -le $Total -a $Withd -ge 1 ]; then 
						#If the Withrawn money is less than or equal to saldo and not less than 1
							Total=$[$Total-$Withd]
							Pocket=$[$Pocket+$Withd]
							echo "Your saldo is: $ $Total"
							echo "Your pocket money is: $ $Pocket"
						elif [ $Withd -gt $Total ]; then
						#If the Withdrawn money is more than available.
							echo "You only have $ $Total!"
						else
							echo "$Withd Invalid amount!"
						fi
					else
						echo "$Withd Invalid input!"
					fi
				;;
				D|d)
					read -p "How much do you want to deposit? " Depo
					if [[ $Depo != *[!0-9]* ]]; then #Makes sure there's no string
						if [ $Depo -le $Pocket -a $Depo -gt 1 ]; then
							Total=$[$Total+$Depo]
							Pocket=$[$Pocket-$Depo]
							echo "Your saldo is: $ $Total"
							echo "Your pocket money is: $ $Pocket"
						elif [ $Depo -gt $Pocket ]; then
							echo "You only have $ $Pocket in your pockets!"
						else
							echo "You can't add such a number!"
						fi
					else
						echo "$Depo Invalid input!"
					fi
				;;
				C|c )
					echo "Your saldo is: $ $Total"
				;;
				E|e ) 
					echo "Good Bye!"
					exit 0
				;;
				* )
					echo "Invalid input!"
				;;
				esac
				break
			else
				((Fail++))
				if [ $Fail -lt 3 ]; then
					echo "Try again!"
					echo "$Fail"
				else
					echo "You wrote the wrong PIN too many times!"
					break
				fi
			fi
		done

	elif [ "${Cho[0]}" = "E" -o "${Cho[0]}" = "e" ]; then #Exit chosen
		echo "Good Bye!"
		exit 0
	else
		echo "Invalid input. Please try again."
	fi
done
echo "Good Bye!"
exit 0
