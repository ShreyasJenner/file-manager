#!/bin/bash

# This script contains main code for reading dirs in 
# current dir and displaying it using dialog

##### ENVS #####
DIR="/home/ouroboros/dev/projects/git/file-manager"
##### ENVS #####

##### VARIABLE #####
declare dir
declare lines
declare hidden_dirs
declare hidden_lines
##### VARIABLE #####

##### STORE VISIBLE DIRECTORIES INTO arr #####

# Query name of all visible files and dirs in current file
# Store value into dir
#
# Query number of lines in dir
# Store value in lines
#
# If dir is not empty then increment lines by 1
function visible_dirs() {
    dir=$(find . -maxdepth 1 \( -name '.*' -o -printf '%f\n' \))
    lines=$(echo "$dir" | wc -l)
}

# Works same as function store_dir
# Difference is it find hidden files and dirs as well
function hidden_dirs() {
    hidden_dirs=$(find . -maxdepth 1 \( -printf '%f\n' \))
    hidden_lines=$(echo "$hidden_dirs" | wc -l)
    (( hidden_lines-- ))
}

# Accepts as argument lines and dirs
# Stores values into a file called tree in project dir
function store_data() {
    echo "$1" > "$DIR"/tree
    echo "$2" >> "$DIR"/tree
}

if [ "$visible" == true ];
then
    visible_dirs 
    store_data "$lines" "$dir"
elif [ "$visible" == false ];
then
    hidden_dirs
    store_data "$hidden_lines" "$hidden_dirs"
    sed -i '2d' "$DIR"/tree 
fi


