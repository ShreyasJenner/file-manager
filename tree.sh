#!/bin/bash

# This script contains main code for reading dirs in 
# current dir and displaying it using dialog

##### ENVS #####
DIR="/home/ouroboros/dev/projects/git/file-manager"
##### ENVS #####


##### STORE VISIBLE DIRECTORIES INTO arr #####
function store_dirs() {
    dir=$( find . -maxdepth 1 -type d \( -name '.*' -o -printf '%f\n' \))
    lines=$(echo "$dir" | wc -l)
    if ! [ -z "$dir" ];
    then
        (( lines++ ))
    fi
    echo "$lines" > "$DIR"/tree
    echo ".." >> "$DIR"/tree
    echo "$dir" >> "$DIR"/tree
}
##### STORE VISIBLE DIRECTORIES INTO arr #####
store_dirs 
