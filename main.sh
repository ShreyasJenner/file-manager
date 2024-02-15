
DIR="/home/ouroboros/dev/projects/git/file-manager"

var=""
state=""
export visible=true
while [ "$var" != '.' ];
do
#echo "$var" >> "$DIR"/.logs
    "$DIR"/./tree.sh
    "$DIR"/./format.sh
    var=$("$DIR"/./fm < "$DIR"/formatted)

    if [[ "$var" == "a/a" ]];
    then
        if [[ "$visible" == false ]];
        then
            export visible=true
        elif [[ "$visible" == true ]];
        then
            export visible=false
        fi
    elif [[ -d "$var" ]];
    then
        cd "$var"
    elif [[ -f "$var" ]];
    then
        xdg-open "$var" &
        break
    fi
done

### Terminal Sanity Restoration ###
unset visible
tput reset
if [[ "$state" == "NR" ]];
then
    echo "Permission denied"
fi
### Terminal Sanity Restoration ###

