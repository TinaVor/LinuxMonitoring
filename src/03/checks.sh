#!/bin/bash

function check_args {
  re1='^[1-3]{1}$'
  ex=0
  if [ $# -ne 1 ]; then
    echo "The program accepts only 1 parameter"
    ex=1
  fi
  if [[ ! $1 =~ $re1 ]]; then
    echo "First parametr must be a number in [1, 2, 3]"
    ex=1
  fi
  return $ex
}
