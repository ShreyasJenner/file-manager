#!/bin/bash


DIR="/home/ouroboros/dev/projects/git/file-manager"
hash=$(md5sum "$DIR"/output)

go run $DIR/.

while :
do
    hash2=$(md5sum "$DIR"/output)
    if [ "$hash" != "$hash2" ];
    then
        $DIR/dirs.sh
        echo "check"
        hash2="$hash"
    fi
done
