#!/bin/ash

tshark -i eth0 -l -f 'src port 53' -n -T fields -e dns.qry.name

