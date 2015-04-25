#!/bin/sh

cd src

git checkout master

git fetch mirror

git reset --hard mirror/master

git push
