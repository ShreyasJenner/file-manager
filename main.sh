#!/bin/bash

### ENVS ###
PROJ_DIR="/home/ouroboros/dev/projects/file-manager"
export DIALOGRC="$PROJ_DIR/dialog.conf"
### ENVS ###

# gets list of directories in pwd seprated by ,
#dir=$(find . -maxdepth 1 -type d -printf '%f,')
dir=$(find . -maxdepth 1 -type d -printf '%f,' | tr "," "\n")
lines=$(echo "$dir" | wc -l)
#echo "$dir" | sed -n 2p 

# store all directory names into arr
i=1
declare -a dir_arr=()
dir_arr+=( "$i" )
dir_arr+=( ".." )
(( i++ ))
while (( i <= "$lines"))
do
    dir_arr+=( "$(( i ))" )
    dir_arr+=( $( echo "$dir" | sed -n "${i}"p ) )
    (( i++ ))
done

#echo "${dir_arr[@]}"

### TEST FOR LOOP ###
# for loop to print contents of array
#for i in "${dir_arr[@]}";
#do
#    echo  "$i";
#done
#echo ''
### TEST FOR LOOP ###


### DIALOG BOX CREATION ###
selection=$(dialog --clear \
    --menu "File List" \
    -1 -1 5 \
    "${dir_arr[@]}" \
    3>&1 1>&2 2>&3 3>&- \
)
### DIALOG BOX CREATION ###
if ! [ -z "$selection" ];
then
    cd "${dir_arr[(( 2*selection ))]}"
fi

#cd "${dir_arr["$selection"]}"

### MAIN LOOP ###
#char="a"
#while [ "$char" != "q" ];
#do
#    read char
#    if  printf '%s\0' "${dir_arr[@]}" | grep -q -F -z -x -- "$char" ;
#    then    
#        cd "$char"
#        return 0
#    fi
#
#done
### MAIN LOOP ###


### CLEAR SCREEN ###
tput -x clear
return 0
### CLEAR SCREEN ###
