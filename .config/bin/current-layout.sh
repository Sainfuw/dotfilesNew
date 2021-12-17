#!/bin/bash

layout=$(setxkbmap -query | grep layout | awk '{print $2}')
if [ "$layout" = "us" ]; then
	echo -e " us"
else
	echo -e " es"
fi
