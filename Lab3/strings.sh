#!/bin/bash
String=""
if [ -z "$String" ]; then
	echo "The String is empty."
elif [ -n "$String" ]; then
	echo "The String is not empty."
fi
