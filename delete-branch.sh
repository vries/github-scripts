#!/bin/sh

set -e

pwd=$(pwd -P)

repo="$pwd/src"

(
    cd "$repo"
    git fetch --prune origin
)

branches=$(cd "$repo"
    git branch -r | grep origin/vries \
       | sed 's/^\* /  /')

branch=$(prompt.sh \
    "Which branch do you want to delete" \
    $branches)

branch=$(echo "$branch" \
    | sed 's%^origin/%%')

cd "$repo"

git branch -D "$branch" \
    || true

# http://stackoverflow.com/questions/2003505/delete-a-git-branch-both-locally-and-remotely
git push origin --delete "$branch" \
    || true
