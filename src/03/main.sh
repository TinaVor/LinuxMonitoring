#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod +x $SCRIPT_DIR/checks.sh
. $SCRIPT_DIR/checks.sh

newarray=("$@")
check_args ${newarray[*]}

if [ $? -eq 0 ]; then
  chmod +x $SCRIPT_DIR/clean_by_log.sh
  . $SCRIPT_DIR/clean_by_log.sh
  chmod +x $SCRIPT_DIR/clean_by_time.sh
  . $SCRIPT_DIR/clean_by_time.sh
  chmod +x $SCRIPT_DIR/clean_by_mask.sh
  . $SCRIPT_DIR/clean_by_mask.sh
  case $1 in
    1) clean_by_log ;;
    2) clean_by_time ;;
    3) clean_by_mask ;;
  esac
fi