#!/bin/bash

function create_files { #  $2 name, $3 size, $4 folder path
  # count=1
  # while [ -n "$1" ]
  # do
  #   echo "Parameter #$count = $1"
  #   count=$(( $count + 1 ))
  #   shift
  # done
  ex=0
	path=$4
  num_files=$(($RANDOM % 200 + 1))
	filename=${2%.*}
	ext=${2##*.}
	start_char=$2
	size=${3:0:${#3}-2}
	for (( j=0; j < $num_files; j++ ))
	do
    free_space $3
    if [ $? -eq 0 ]; then
      if [[ ${#filename} -lt 5 ]]; then
        if [[ ${#filename} -lt 4 ]]; then
          if [[ ${#filename} -lt 3 ]]; then
          
            start_char=${filename::1}
            start_char+=$filename
            filename=$start_char
          fi
          start_char=${filename::1}
          start_char+=$filename
          filename=$start_char
        fi
        start_char=${filename::1}
        start_char+=$filename
        filename=$start_char
      fi
      filename+=${filename: -1}
      final_filename=$filename
      final_filename+="."
      final_filename+=$ext
      touch $path/$final_filename
      fallocate -l ${size}MB $path/$final_filename
      # echo "File created: "$path"/"$final_filename" - $(date +"%d-%m-%Y") - $(du -k "$path"/"$final_filename" | awk '{print $1}')" >> log_file.log
      echo "File created: "$path"/"$final_filename" - $(date +"%d-%m-%Y") - ${size}.0Mb" >> $5/log_file.log
    else
      ex=1
      break
    fi
	done
  return $ex
}

function create_folders {
  len_dir_name=5
  len_alpha_set=${#1}
  if [ $len_dir_name -lt $len_alpha_set ]; then
    len_dir_name=$len_alpha_set
  fi
  folder_name=""
  num_symb=1
  for (( num_folder=1; num_folder<=$5; ++num_folder ))
  do
    let numb_char=$len_dir_name/$len_alpha_set
    len_ad_char=$(($len_dir_name%$len_alpha_set))
    for (( symb_f_n=0; symb_f_n<$len_alpha_set; ++symb_f_n ))
    do
      current_char=${1:$symb_f_n:1}
      for ((ch_str=0; ch_str<numb_char; ++ch_str))
      do
        folder_name+=$current_char;
      done
      if [ $len_ad_char -gt 0 ]; then
        folder_name+=$current_char;
        ((--len_ad_char))
      fi
    done
    
    folder_name+="_"
    folder_name+=$(date +"%d%m%y")
    mkdir $4/$folder_name
    echo "Folder created: $(pwd $4)/$folder_name/ - $(date +"%d-%m-%Y") - $(du -h $4/$folder_name/ | awk '{print $1}')" >> $6/log_file.log
    free_space $3
    if [ $? -eq 0 ]; then
      create_files ${newarray[*]} $4/$folder_name $6
      if [ $? -eq 1 ]; then
        echo "There is not enough free disk space to create a file or there is free space less then 1 GB"
        num_folder=$5
        num_folder=$(( $num_folder + 1 ))
      else
        folder_name=""
        ((++len_dir_name))
        ((++num_symb))
      fi
    else
      echo "There is not enough free disk space to create a file or there is free space less then 1 GB"
      num_folder=$5
      num_folder=$(( $num_folder + 1 ))
    fi
  done

}