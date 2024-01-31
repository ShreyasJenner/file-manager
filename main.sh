
DIR="/home/ouroboros/dev/projects/git/file-manager"

var=""
state=""
while [ "$var" != '.' ];
do
    "$DIR"/./tree.sh
    "$DIR"/./format.sh
    var=$("$DIR"/./fm < "$DIR"/formatted)

    if ! [ -r "$var" ];
    then
        state="NR"  # No read permission
        break
    elif [ -d "$var" ];
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
if [ "$state" == "NR" ];
then
    echo "Permission denied"
fi
### Terminal Sanity Restoration ###

