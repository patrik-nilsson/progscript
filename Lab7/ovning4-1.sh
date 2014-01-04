#!/bin/bash
zenity --list \
  --title="Choose the Bugs You Wish to View" \
  --column="Bug Number" \
  "google-chrome" \
  "firefox" \
  >/tmp/menu
Cho=`cat /tmp/menu`
`cat /tmp/menu`
exit 0
