#!/bin/bash

DIR="/home/ouroboros/dev/projects/git/file-manager"


function store_dir() {
    echo "$DIR/.." > "$DIR"/input;
    for D in `find . -maxdepth 1 -type d`;
    do 
        echo $PWD${D#.} >> "$DIR"/input;
    done
}
var=$(cat $DIR/output)
cd "$var"

var=$(cat $DIR/input)
store_dir $var
