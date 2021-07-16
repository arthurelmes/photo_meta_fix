#!/bin/bash

in_dir="/media/arthur/Media3/photo_temp/fix_metadata/"
x=0
find ${in_dir} -type f -name "*" -and -not -name "*json*" -and -not -name "*.sh*" -print0 | while IFS= read -r -d '' file; do   
    name=`basename "${file}"`
    path=`dirname "${file}"`
    IFS='.'
    read -ra ADDR <<< "$name"
    name_bare=`echo "${ADDR[0]}"`
    ext=`echo "${ADDR[-1]}"`
    IFS=' '
    name_new=${name_bare}_${x}.${ext}
    echo mv "${path}"/"${name}" "${path}"/"${name_new}"
    mv "${path}"/"${name}" "${path}"/"${name_new}"
    x=$((x+1))
done
