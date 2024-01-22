
DIR="/home/ouroboros/dev/projects/git/file-manager"

var=""
while [ "$var" != '.' ];
do
    "$DIR"/./tree.sh
    var=$("$DIR"/./fm < "$DIR"/tree)

    cd $var
done
