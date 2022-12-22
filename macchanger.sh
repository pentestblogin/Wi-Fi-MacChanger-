#!/bin/bash 

ifconfig  wlan0 down 
macchanger -l > New-MacAddress
first=$(shuf -n 1 New-MacAddress | awk '{print $3}')
end=$(printf '%02x:%02x:%02x' $[RANDOM%255] $[RANDOM%255] $[RANDOM%255])
macchanger -m "$first:$end" wlan0
ifconfig  wlan0 up
