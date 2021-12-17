#!/bin/bash

layout=$(setxkbmap -query | grep layout | awk '{print $2}')
if [ "$layout" = "us" ]; then
	setxkbmap es
else
	setxkbmap us
fi
