#!/bin/bash

# This script contains main code for reading dirs in 
# current dir and displaying it using dialog

##### ENVS #####
PROJ_DIR="/home/ouroboros/dev/projects/file-manager"
export DIALOGRC="$PROJ_DIR/dialog.conf"
##### ENVS #####



##### DECLARING/INITIALIZING VARIABLES #####
declare -a dir_arr=()
#all_dirs=$(find . -maxdepth 1 -type d -printf '%f\n')
declare path
##### DECLARING/INITIALIZING VARIABLES #####



##### STORE VISIBLE DIRECTORIES INTO arr #####
function store_dirs() {
    i=0
    dir=$( find . -maxdepth 1 -type d \( -name '.*' -o -printf '%f\n' \))
    lines=$(echo "$dir" | wc -l)
    local -n arr=$1
    arr=()
    arr+=( "$i" )
    arr+=( ".." )
    (( i++ ))
    while (( i <= "$lines"))
    do
        temp=$(echo "$dir" | sed -n "$(( i ))"p)
        arr+=( "$(( i ))" )
        arr+=( "$temp" )
        (( i++ ))
    done
}
##### STORE VISIBLE DIRECTORIES INTO arr #####



##### DIALOG BOX CREATION #####
function dialog_box() {
    selection=$(dialog --clear \
        --menu "File List" \
        -1 -1 5 \
        "${dir_arr[@]}" \
        3>&1 1>&2 2>&3 3>&- \
    )
}
##### DIALOG BOX CREATION #####



##### MAIN LOOP #####
selection="a"
while ! [ -z "$selection" ];
do
    store_dirs dir_arr
    dialog_box
    #echo "${dir_arr[@]}"
    #read selection
    #echo "${dir_arr[(( 2*selection+1 ))]}"
    cd "${dir_arr[(( 2*selection+1 ))]}"
    path=$(pwd)
done
echo "$path"
##### MAIN LOOP #####



##### CLEAR SCREEN #####
#tput -x clear
##### CLEAR SCREEN #####
