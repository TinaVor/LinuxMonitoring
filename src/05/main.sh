#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod +x $SCRIPT_DIR/checks.sh
. $SCRIPT_DIR/checks.sh

newarray=("$@")
check_args ${newarray[*]}

if [ $? -eq 0 ]; then
  chmod +x $SCRIPT_DIR/sort_by_response_code.sh
  . $SCRIPT_DIR/sort_by_response_code.sh
  chmod +x $SCRIPT_DIR/all_unique_ips.sh
  . $SCRIPT_DIR/all_unique_ips.sh
  chmod +x $SCRIPT_DIR/errors_requests.sh
  . $SCRIPT_DIR/errors_requests.sh
  chmod +x $SCRIPT_DIR/errors_unique_ips.sh
  . $SCRIPT_DIR/errors_unique_ips.sh
  reg="../04/logs/[0-9]{2}-[0-9]{2}-[0-9]{4}.log"
  case $1 in
    1)
      name_of_dir="sorted_by_response_code"
      echo "The sorted data by code in \"$name_of_dir\""
      mkdir $name_of_dir
      for file in ../04/logs/*; do
        if [[ $file =~ $reg ]]; then
        sort_by_code $file $name_of_dir
      fi
      done
    ;;
    2)
      name_of_dir="unique_ips"
      echo "Unique IPs are in the \"$name_of_dir\""
      mkdir $name_of_dir
      for file in ../04/logs/*; do
        if [[ $file =~ $reg ]]; then
        unique_ips $file $name_of_dir
      fi
      done
    ;;
    3)
      name_of_dir="error_requests"
      echo "Requests  with errors are in the \"$name_of_dir\""
      mkdir $name_of_dir
      for file in ../04/logs/*; do
        if [[ $file =~ $reg ]]; then
        get_error_requests $file $name_of_dir
      fi
      done
    ;;
    4)
      name_of_dir="ips_errors"
      echo "Request's unique ips with errors are in the \"$name_of_dir\""
      mkdir $name_of_dir
      for file in ../04/logs/*; do
        if [[ $file =~ $reg ]]; then
        ips_error_requests $file $name_of_dir
      fi
      done
    ;;
  esac
fi