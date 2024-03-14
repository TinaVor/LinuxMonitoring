#!/bin/bashs

function free_space {
  ex=0
  space=$(df -h -BG / | awk 'FNR == 2 {printf "%.1f", $4}')
  file_size=$( echo "$1" | sed 's/Mb//')
  left_space=$( echo "($space-($file_size/1024))" |bc -l)
	if (( $( echo "$left_space <= 1.0" | bc -l) )); then
		ex=1
	fi
  return $ex
}