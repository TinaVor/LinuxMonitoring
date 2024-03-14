#!/bin/bash

start_time=`date +%T`
start=`date +%s`

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Start time of the script: $start_time" >> $SCRIPT_DIR/log_file.log
chmod +x $SCRIPT_DIR/checks.sh
. $SCRIPT_DIR/checks.sh

cur_dir=$(pwd)
newarray=("$@")
check_args ${newarray[*]}

if [ $? -eq 0 ]; then
  chmod +x $SCRIPT_DIR/fr_space.sh
  chmod +x $SCRIPT_DIR/mk_dir.sh
  . $SCRIPT_DIR/fr_space.sh
  free_space $3
  if [[ $? -eq 0 ]]; then
    . $SCRIPT_DIR/mk_dir.sh
    if [[ $cur_dir != *"/bin"* && $cur_dir != *"/sbin"* ]]; then
      num_dirs=$((1 + $RANDOM % 100))
      create_folders ${newarray[*]} $cur_dir $num_dirs $SCRIPT_DIR
    else
      echo "Folders will not be created in this directory"
    fi
  else
    echo "There is not enough free disk space to create a file or there is free space less then 1 GB main"
  fi
fi

end_time=`date +%T`
echo "End time of the script: $end_time" >> $SCRIPT_DIR/log_file.log
end=`date +%s`
runtime=$((end-start))
echo "Run time of the script: $runtime seconds" >> $SCRIPT_DIR/log_file.log

echo "Start time = $start_time"
echo "End time = $end_time"
echo "Runtime = $runtime seconds"
