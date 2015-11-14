#!/bin/sh

pwd=$(pwd -P)

repo="$pwd/src"

cd "$repo"

git fetch -p gcc-gnu-org
git fetch -p origin

git checkout master
git reset --hard gcc-gnu-org/master
git push origin master

git checkout trunk
git reset --hard gcc-gnu-org/master
git push origin trunk

git checkout gomp-4_0-branch
git reset --hard svn/gomp-4_0-branch
git push origin gomp-4_0-branch

