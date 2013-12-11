#!/bin/bash
declare -r OS="Ubuntu"
echo "$OS"
OS="Windows" #Will not work, read-only variable.
echo "$OS"
exit 0
