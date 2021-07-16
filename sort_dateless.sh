#!/bin/bash

in_dir="/media/arthur/Media3/photo_temp/fix_metadata/"
org_dir="/media/arthur/Media3/photo_temp/fix_metadata/all_photos/no_date_new/"

for dir in ${in_dir}takeout-20210419T132735Z-???/Takeout/"Google Photos"/*;
do
    if [[ ! $dir == *"json"* ]];
    then
	for pic in ${dir}/*.*;
	do
	    if [[ "$pic" == *"jpg" ]] || [[ "$pic" == *"JPG" ]];
	    then
		if [[ -z `exiftool "${pic}" | grep 'Create \Date'` ]] &&
		       [[ -z `exiftool "${pic}" | grep 'Date/Time \Original'` ]]  &&
		       [[ -z `exiftool "${pic}" | grep 'Modify \Date'` ]];
		then
		    echo "No Date"
		    # mv "${pic}" ${org_dir}
		    # else
		    # echo "Has Date"
		fi
            fi
	    
	done
    fi
done
