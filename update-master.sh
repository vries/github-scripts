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

git checkout gcc-4_9-branch
git reset --hard gcc-gnu-org/gcc-4_9-branch
git push origin gcc-4_9-branch

git checkout gcc-5-branch
git reset --hard gcc-gnu-org/gcc-5-branch
git push origin gcc-5-branch

git checkout gcc-6-branch
git reset --hard gcc-gnu-org/gcc-6-branch
git push origin gcc-6-branch

#git checkout gcc-7-branch
#git reset --hard gcc-gnu-org/gcc-7-branch
#git push origin gcc-7-branch

#git checkout openacc-gcc-7-branch
#git reset --hard gcc-gnu-org/openacc-gcc-7-branch
#git push origin openacc-gcc-7-branch

