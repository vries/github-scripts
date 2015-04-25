#!/bin/sh

pwd=$(pwd -P)

repo="$pwd/src"

cd "$repo"

git checkout master

git fetch mirror

git reset --hard mirror/master

git push
