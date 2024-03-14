#!/bin/bash

function create_files {
  ex=1
	path=$7
	filename=${5%.*}
	ext=${5##*.}
	start_char=$5
	size=${6:0:${#6}-2}
	for (( j=0; j < $4; j++ ))
	do
    free_space $6
    if [ $? -ne 0 ]; then
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
      filename+=${filename: -1}
      final_filename=$filename
      final_filename+="."
      final_filename+=$ext
      touch $path/$final_filename
      fallocate -l ${size}K $path/$final_filename
      # echo "File created: "$path"/"$final_filename" - $(date +"%d-%m-%Y") - $(du -k "$path"/"$final_filename" | awk '{print $1}')" >> log_file.log
      echo "File created: "$path"/"$final_filename" - $(date +"%d-%m-%Y") - ${size}.0K" >> log_file.log
    else
      # echo "There is not enough free disk space to create a file"
      ex=0
      break
    fi
	done
  return $ex
  # TODO echo or return with run result for example error
}

function create_folders {
  len_dir_name=4
  len_alpha_set=${#3}
  if [ $len_dir_name -lt $len_alpha_set ]; then
    len_dir_name=$len_alpha_set
  fi
  folder_name=""
  num_symb=1
  for (( num_folder=1; num_folder<=$2; ++num_folder ))
  do
    let numb_char=$len_dir_name/$len_alpha_set
    len_ad_char=$(($len_dir_name%$len_alpha_set))
    for (( symb_f_n=0; symb_f_n<$len_alpha_set; ++symb_f_n ))
    do
      current_char=${3:$symb_f_n:1}
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
    mkdir $1/$folder_name
    echo "Folder created: $(pwd $1)/$folder_name/ - $(date +"%d-%m-%Y") - $(du -h $1/$folder_name/ | awk '{print $1}')" >> log_file.log
    free_space $6
    if [ $? -ne 0 ]; then
      create_files ${newarray[*]} $1/$folder_name
      if [ $? -eq 0 ]; then
        echo "There is not enough free disk space to create a file or there is free space less then 1 GB"
        num_folder=$2
        num_folder=$(( $num_folder + 1 ))
      else
        folder_name=""
        ((++len_dir_name))
        ((++num_symb))
      fi
    else
      echo "There is not enough free disk space to create a file or there is free space less then 1 GB"
      num_folder=$2
      num_folder=$(( $num_folder + 1 ))
    fi
  done

}