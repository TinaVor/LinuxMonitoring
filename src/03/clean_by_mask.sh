#!/bin/bash

function clean_by_mask {
  current_date=$(date +"%d%m%y")
  find /home -type d -name "*_$current_date*" | xargs rm -rf &> /dev/null &> /dev/null
}