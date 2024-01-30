
DIR="/home/ouroboros/dev/projects/git/file-manager"

var=""
while [ "$var" != '.' ];
do
    "$DIR"/./tree.sh
    "$DIR"/./format.sh
    var=$("$DIR"/./fm < "$DIR"/formatted)

    if [ -d "$var" ];
    then
        cd "$var"
    elif [ -f "$var" ];
    then
        xdg-open "$var" &
        break
    fi
done

### Terminal Sanity Restoration ###
tput reset
echo "$var"
pwd
### Terminal Sanity Restoration ###

