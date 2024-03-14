#!/bin/bash/

function clean_by_time {
  echo "Enter time start & time end by format> for example: 2023-08-17 02:00"
  echo "Both start and end date should be entered"

  echo "Enter the start date:"
  read start
  re1='^[[:digit:]]{4}\-[[:digit:]]{2}\-[[:digit:]]{2} [[:digit:]]{2}\:[[:digit:]]{2}$'

  if [ -z "$start" ]
  then
    echo "Date cannot be empty. Please try again"
    exit 1
  fi
  if [[ ! $start =~ $re1 ]]
  then
    echo "Wrong format"
    exit 1
  fi

  echo "Enter the end date:"
  read end

  if [ -z "$end" ]
  then
    echo "Date cannot be empty. Please try again"
    exit 1
  fi
  if [[ ! $end =~ $re1 ]]
  then
    echo "Wrong format"
    exit 1
  fi

  find /home -type f -newermt "$start" ! -newermt "$end" -delete &> /dev/null
  sleep 2
  find /home -type d -empty -newermt "$start" ! -newermt "$end" -exec rm -rf {} \; &> /dev/null # -delete &> /dev/null #| xargs rm -rf &> /dev/null
}