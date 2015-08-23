#!/bin/sh

pwd=$(pwd -P)

repo="$pwd/src"

cd "$repo"

git checkout master

git fetch -p mirror
git fetch -p origin

git reset --hard mirror/master

git push
