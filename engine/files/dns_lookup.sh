#!/bin/ash

[[ -n "$1" ]] || exit 0
nslookup "$1" 127.0.0.1 | tail -n 1 | awk '{ print $4 }'
