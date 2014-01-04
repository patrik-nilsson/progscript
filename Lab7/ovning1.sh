#!/bin/bash
dialog --menu "Choose your browser" 10 60 3 google-chrome "Google Chrome" firefox "Firefox" 2> /tmp/menu
Cho=`cat /tmp/menu`
`cat /tmp/menu`
exit 0
