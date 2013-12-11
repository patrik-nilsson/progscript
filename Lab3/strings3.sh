#!/bin/bash
String1="Xummer"
String2="Winter"
if [ "$String1" \> "$String2" ]; then
	echo "String1 is bigger than String2."
elif [ "$String1" \< "$String2" ]; then
	echo "String1 är mindre än String2."
fi
exit 0
