#!/bin/bash

var=$(cat tree)
#echo "$var"

i=1

while [ "$i" -lt 11 ];
do
    fil=$(sed -n "${i}"p tree)

    if [ -d "$fil" ];
    then
        echo "$fil" dir
    else
        echo "$fil" file
    fi

    (( i++ ))
done

