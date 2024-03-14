#!/bin/bash

function get_error_requests {
	local log_file_path=$1
	local dir=$2
	local name=${log_file_path[@]:11}
	awk  -F ' ' -e '$9 ~ /[45]{1}../ { print $0 }' $log_file_path | sort -k9 >> $dir/"$name"
}