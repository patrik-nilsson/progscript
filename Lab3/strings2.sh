#!/bin/bash
String1="Ubuntu"
String2="Ubuntu"
if [ "$String1" = "$String2" ]; then
	echo "String1 är likadan som String2."
elif [ "$String1" != "$String2" ]; then
	echo "String1 är inte likadan som String2."
fi
exit 0
