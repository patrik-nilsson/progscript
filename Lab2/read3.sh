#!/bin/bash
echo -n "What's your name? "
read -t 3 Name
Name=${Name:="Secret"}
echo -e "\nHello, $Name."
exit 0
