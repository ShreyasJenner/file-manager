#!/bin/bash

export DIALOGRC=".dialogrc"
declare -a arr
arr+=("sport" "football" "basket")
i=(1 2 3)
var=$(dialog --clear \
    --menu "File List" \
    20 30 5\
    1 "checkre" \
    2 "esel" \
    3 "${arr[@]}" \
    3>&1 1>&2 2>&3 3>&- \
)
echo $var
