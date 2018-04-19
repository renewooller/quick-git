#!/bin/sh
CUR=`git rev-parse --abbrev-ref HEAD`
TODEL=${1:-$CUR}
if [ "$TODEL" == 'master' ]; then 
    echo "Cannot delete master branch"
    exit 1;
fi

echo deleting $TODEL locally and remotely

if [ "$CUR" == '$TODEL']; then 
    echo "Switching to master so as to be able to delete the current branch"
    git checkout master
fi

git push -d origin $TODEL
git branch -d $TODEL
