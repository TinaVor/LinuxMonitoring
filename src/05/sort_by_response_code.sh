#!/bin/bash

function sort_by_code {
	local log_file_path=$1
	local dir=$2
	local name=${log_file_path[@]:11}
  awk '{ print $0 }' $log_file_path | sort -k9 >> $dir/$name
}