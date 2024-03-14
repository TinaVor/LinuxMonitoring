#!/bin/bash

function clean_by_log {
  file=../02/log_file.log

  folder_path="$(cat $file | awk -F ' ' '{print $3}')"
  regex='^\/'
  for folder in $folder_path
  do
    if [[ $folder =~ $regex ]]
    then
      $sudo rm -r $folder &> /dev/null
    fi
  done
}