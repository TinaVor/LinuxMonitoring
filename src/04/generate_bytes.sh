#!/bin/bash

function generate_bytes {

	# Minimum ethernet frame size
	local min_bytes=64
	# Most web servers have a limit of 8192 bytes, which is usually configurable in the server configuration
	local max_bytes=8192
	local bytes_sent=$( shuf -i $min_bytes-$max_bytes -n 1 )

	echo $bytes_sent	
}