#!/bin/ash

[[ -n "$2" ]] || exit 0
name=$(nslookup "$2" 127.0.0.1 | tail -n 1 | awk '{ print $4 }')
echo "$1	$2	$name"
