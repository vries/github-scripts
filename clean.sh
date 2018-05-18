#!/bin/sh

cd src

remove_branches=$(git branch \
		  | grep 'vries/' \
		  | sed 's/^\*//')

git br -D $remove_branches
