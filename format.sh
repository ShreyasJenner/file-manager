#!/bin/bash

# formats tree by marking dirs and files

##### ENVS #####
DIR="/home/ouroboros/dev/projects/git/file-manager"
##### ENVS #####

function format() {
    i=1
    count=$(sed -n 1p "$DIR"/tree)
    echo "$count" > "$DIR"/formatted
    while [ "$i" -le "$count" ];
    do
        fil=$(sed -n "$(( i+1 ))"p "$DIR"/tree)
        if [ -d "$fil" ];
        then
            echo "D${fil}" >> "$DIR"/formatted
        else
            echo "F${fil}" >> "$DIR"/formatted
        fi
        (( i++ ))
    done
}

format
