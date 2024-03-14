#!/bin/bash

function unique_ips {

	local log_file_path=$1
	local dir=$2
	local name=${log_file_path[@]:11}
	awk -F ' ' '{ print $1 }' $log_file_path | sort -nu >> $dir/"$name"
}