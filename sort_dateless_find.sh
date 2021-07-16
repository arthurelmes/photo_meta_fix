#!/bin/bash

in_dir="/media/arthur/Media3/photo_temp/fix_metadata/"
org_dir="/media/arthur/Media3/photo_temp/fix_metadata/all_photos/no_date_new/"

find ${in_dir} -type f -name "*" -and -not -name "*json*" -and -not -name "*.sh*" -print0 | while IFS= read -r -d '' file; do   
    echo $file
    if [[ -z `exiftool "${file}" | grep 'Create \Date'` ]] &&
	   [[ -z `exiftool "${file}" | grep 'Date/Time \Original'` ]]  &&
	   [[ -z `exiftool "${file}" | grep 'Modify \Date'` ]];
    then
	echo "No Date"
	mv "${file}" ${org_dir}
	# else
	# echo "Has Date"
    fi;
done
