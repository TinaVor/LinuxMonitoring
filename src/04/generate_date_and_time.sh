#!/bin/bash

num_to_insert_zeros=9
function insert_zero() {
	zero_inserted=$1
	if [[ $1 -le num_to_insert_zeros ]]; then
		zero_inserted="0$1"
	fi
	echo $zero_inserted
}
min_year=2001
max_year=2023
diff=$max_year-$min_year
year=$(( $RANDOM % diff + min_year ))
max_month=12
monthes=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
month_s=$( shuf -e ${monthes[@]} -n 1)
if [[ ($(($year%4)) -eq 0 && $(($year%100)) -ne 0) || ($(($year%4)) -eq 0 && $(($year%100)) -eq 0 && $(($year%400)) -eq 0 ) ]]; then
  leap_year=0
else
  leap_year=1
fi
month31=(Jan Mar May Jul Aug Oct Dec)
month30=(Apr Jun Sep Nov)
month289=Feb
if [[ " ${month31[*]} " =~ " ${month_s} " ]]; then
  max_day=31
elif [[ " ${month30[*]} " =~ " ${month_s} " ]]; then
  max_day=30
elif [[ " ${month289[*]} " =~ " ${month_s} " && $leap_year == 0 ]]; then
  max_day=29
else
  max_day=28
fi
month=-1
for i in "${!monthes[@]}";
do
  if [[ "${monthes[$i]}" = "${month_s}" ]];
  then
      month=$(( $i + 1 ))
      break
  fi
done
month=$( insert_zero $month)
day=$( shuf -i 1-$max_day -n 1)
day=$( insert_zero $day)
max_hour=24
hour=$(( $RANDOM % 24))
max_minute=59
max_start_minute=42
minute=$(( $RANDOM % $max_start_minute + 1))
max_second=59
second=$(( $RANDOM % $max_second + 1))