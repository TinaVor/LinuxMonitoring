#!/bin/bashs

function free_space {
  ex=1
  space=$(df -k -BK / | awk 'FNR == 2 {printf "%.2f", $4}')
  file_size=$( echo "$1" | sed 's/kb//')
  left_space=$( echo "($space-$file_size)/1024/1024" |bc -l)
	if (( $( echo "$left_space <= 1.0" | bc -l) )); then
		ex=0
	fi
  return $ex
}