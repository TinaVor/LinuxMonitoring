#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
num_files=5
directory_for_logs="logs"
mkdir $directory_for_logs
for (( index = 0; index < $num_files; ++index )); do
	chmod +x $SCRIPT_DIR/generate_file.sh
	. ./generate_file.sh $directory_for_logs
done
echo "The logs are in the \"$directory_for_logs\" directory"