#!/bin/sh
NEW=$1
CUR=`git rev-parse --abbrev-ref HEAD`
echo renaming $CUR to $NEW

git branch -m $NEW && git push origin :$CUR $NEW && git push origin -u $NEW
