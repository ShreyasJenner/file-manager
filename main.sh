#!/bin/bash

# gets list of directories in pwd seprated by ,
dir=$(find . -maxdepth 1 -type d -printf '%f,')
#echo "$dir"

# store all directory names into arr
i=1
arr=()
while (( i <= 3))
do
    arr+=( $( echo "$dir" | cut -d "," -f $i ) )
    (( i++ ))
done

echo "${arr[@]}"
# for loop to print contents of array
#for i in "${arr[@]}";
#do
#    echo  "$i";
#done
#echo ''

char="a"
while [ "$char" != "q" ];
do
    read char
    if  printf '%s\0' "${arr[@]}" | grep -q -F -z -x -- "$char" ;
    then    
        cd "$char"
        return 0
    fi

done
