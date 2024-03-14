#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SCRIPT_DIR/checks.sh

newarray=("$@")
check_args ${newarray[*]}

if [ $? -eq 0 ]; then
  chmod +x $SCRIPT_DIR/fr_space.sh
  chmod +x $SCRIPT_DIR/mk_dir.sh
  . $SCRIPT_DIR/fr_space.sh
  free_space $6
  if [ $? -ne 0 ]; then
    . $SCRIPT_DIR/mk_dir.sh
    create_folders ${newarray[*]}
  else
    echo "There is not enough free disk space to create a file or there is free space less then 1 GB main"
  fi
fi
