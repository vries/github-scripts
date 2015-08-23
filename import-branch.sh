#!/bin/sh

set -e

repo="$1"
base="$2"
branch="$3"
torepo="$4"
tobranch="$5"

pwd=$(pwd -P)

filename=$(echo $branch \
    | sed 's%/%-%g')


bundle="$pwd/$filename.bundle"
rm -f "$bundle"

(
    cd "$repo"

    git bundle create "$bundle" "$base..$branch"
)

(
    cd "$torepo"

    commit=$(git bundle list-heads "$bundle" "refs/heads/$branch" \
	| awk '{print $1}')

    git bundle verify "$bundle"

    git bundle unbundle "$bundle"

    git branch -D "$tobranch" \
	|| true

    git branch "$tobranch" "$commit"
)

rm "$bundle"
