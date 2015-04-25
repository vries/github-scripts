#!/bin/sh

set -e

pwd=$(pwd -P)

repo="$pwd/src"

branch=$(git-prompt-branch.sh \
    "Which branch do you want to delete" \
    "$repo")

cd "$repo"

git branch -D "$branch" \
    || true

# http://stackoverflow.com/questions/2003505/delete-a-git-branch-both-locally-and-remotely
git push origin --delete "$branch" \
    || true
