#!/bin/bash

echo -e " $(ip a 2>/dev/null| grep "inet " | awk '{print $2}' | tail -n 1 | sed 's/\/24//')%{u-}"
