#!/bin/bash

function check_args {
  re1='^[1-4]{1}$'
  local ext=0
  if [ $# -ne 1 ]; then
    echo "The program accepts only 1 parameter"
    ext=1
  fi
  if [[ ! $1 =~ $re1 ]]; then
    echo "First parametr must be a number in [1, 2, 3, 4]"
    ext=1
  fi
  return $ext
}
