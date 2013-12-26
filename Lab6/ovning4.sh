#!/bin/bash
function Add {
	Sum=$[$1+$2]
	return $Sum
}
function Sub {
	Dif=$[$1-$2]
	return $Dif
}
function Mul {
	Pro=$[$1*$2]
	return $Pro
}
function Div {
	Quo=$[$1/$2]
	return $Quo
}
echo "Write two numbers and choose how to deal with them"
read Nr1
read Nr2
select Cho in Add Sub Mul Div Exit; do
	case $Cho in
		Add)
			Add $Nr1 $Nr2
			echo "$?"
		;;
		Sub)
			Sub $Nr1 $Nr2
			echo "$?"
		;;
		Mul)
			Mul $Nr1 $Nr2
			echo "$?"
		;;
		Div)
			Div $Nr1 $Nr2
			echo "$?"
		;;
		Exit)
			exit 0
		;;
		*)
			echo "Invalid input!"
		;;
	esac
done
exit 0
