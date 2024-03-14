#!/bin/bash

function check_args {
  re2='^[[:digit:]]+$'
  re3='^[A-Za-z]+$'
  re5='^[A-Za-z]+\.[A-Za-z]+$'
  re6='^[[:digit:]]+kb$'
  ex=0
  if [ $# -eq 0 ]; then
    echo "Not all parameters are specified"
    ex=1
  elif [ $# -ne 6 ]; then
    echo "Six parameters must be entered"
    ex=1
  else
    if [[ ! -d $1 || $1 != /* ]]; then
      echo "First parametr must be an absolute path"
      echo "$1"
      ex=1
    fi
    if [[ ! $2 =~ $re2 ]]; then
      echo "Second parametr must be a digit"
      ex=1
    fi
    if [[ ! $3 =~ $re3 ]]; then
      echo "Third parametr must be a string with letters of the Latin alphabet"
      ex=1
    fi
    if [[ "${#3}" -gt 7 ]]; then
      echo "Third parametr lenth must be less or equal 7"
      ex=1
    fi
    if [[ ! $4 =~ $re2 ]]; then
      echo "Fourth parametr must be a digit"
      ex=1
    fi
    if [[ ! $5 =~ $re5 ]]; then
      echo "Fifth parametr must be a string with format: asd.asd"
      ex=1
    fi
    len_name=$(echo "$5" | awk -F"." '{print $1}')
    len_name=${#len_name}
    len_extension=$(echo "$5" | awk -F"." '{print $2}')
    len_extension=${#len_extension}
    if [[ $len_name -gt 7 || $len_extension -gt 3 ]]; then
      echo "Filename & extension length must be less or equal 7 & 3 respectively"
      ex=1
    fi
    if [[ ! $6 =~ $re6 ]]; then
      echo "Sixth parametr must be a string with format: 34kb"
      ex=1
    fi
    if [[ ${6%kb} -gt 100 ]]; then
      echo "Sixth parametr must be less or equal 100"
      ex=1
    fi
  fi
  return $ex
}
