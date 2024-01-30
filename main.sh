
DIR="/home/ouroboros/dev/projects/git/file-manager"

var=""
while [ "$var" != '.' ];
do
    "$DIR"/./tree.sh
    var=$("$DIR"/./fm < "$DIR"/tree)

    if [ -d "$var" ];
    then
        cd $var
    elif [ -f "$var" ];
    then
        xdg-open "$var" &
        break
    fi
done

### Terminal Sanity Restoration ###
tput reset
### Terminal Sanity Restoration ###

