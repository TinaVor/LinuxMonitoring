#!/bin/bash

# Class A network range: 0.0.0.0 - 127.255.255.255

function generate_ip {
	local first=$( shuf -i 0-127 -n 1)
	local second=$( shuf -i 0-255 -n 1)
	local third=$( shuf -i 0-255 -n 1)
	local forth=$( shuf -i 0-255 -n 1)
	local ip="$first.$second.$third.$forth"
	echo $ip
}