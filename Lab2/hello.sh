#!/bin/bash
#A script that writes out some text, including the logged in user's name.
echo "Hello world!" #Writes Hello world!
echo "Hello $USER!" #Writes Hello patrik! (Or whoever's name is logged in)
Name="Lyite"
echo "Hello $Name!" #Writes Hello Lyite!
exit 0
