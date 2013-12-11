#!/bin/bash
declare Name
declare Age
declare State
echo "Please tell me your details:"
read -p "Name: " Name
read -p "Age: " Age
read -p "State/Province: " State
echo "Hello, $Name! You are $Age years old and live in $State."
exit 0
