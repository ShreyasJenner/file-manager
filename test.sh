#!/bin/bash

DIR="/home/ouroboros/dev/projects/git/file-manager"

# cds to arguemnt given and prints absolute path of dirs in there
choice=$(cat $DIR/output)
cd "$choice"

pwd > $DIR/currentdir

cat /dev/null > $DIR/input
for D in `find . -maxdepth 1 -type d -not -path '*/.*'`;
do 
    echo "$PWD$D"
    #if [ "$PWD${D#.}" != "$choice" ];
    #then
    #    echo "$PWD${D#.}";
    #fi
done
