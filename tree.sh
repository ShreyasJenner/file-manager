#!/bin/bash

# This script contains main code for reading dirs in 
# current dir and displaying it using dialog

##### ENVS #####
DIR="/home/ouroboros/dev/projects/git/file-manager"
##### ENVS #####


##### STORE VISIBLE DIRECTORIES INTO arr #####
function store_dirs() {
    dir=$( find $1 -maxdepth 1 -type d \( -name '.*' -o -printf '%p\n' \))
    lines=$(echo "$dir" | wc -l)
    if ! [ -z "$dir" ];
    then
        (( lines++ ))
    fi
    #echo "$lines" > "$DIR"/input
    echo ".." > "$DIR"/input
    echo "$dir" >> "$DIR"/input
}
##### STORE VISIBLE DIRECTORIES INTO arr #####

var=$(cat output)
store_dirs $var
