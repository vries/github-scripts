#!/bin/sh

set -e

pwd=$(pwd -P)
scriptdir=$(cd $(dirname $0); pwd -P)

repo="$pwd/src"

github_cfg="$pwd/github.cfg"
if [ -f "$github_cfg" ]; then
    . "$github_cfg"
fi

separator ()
{
    local n=80
    for i in $(seq 1 $n); do
	echo -n "-"
    done
    echo
}

main ()
{
    separator
    branch=$(git-prompt-branch.sh "Which branch do you want to publish" "$import_repo")
    separator

    echo "Updating master branch"
    separator
    "$scriptdir"/update-master.sh
    separator

    if [ "$branch_prefix" != "" ]; then
	copied_branch=$branch_prefix/$branch
    else
	copied_branch=$branch
    fi
    echo "Copying branch $branch to $copied_branch in local github clone"
    separator
    "$scriptdir"/import-branch.sh \
	"$import_repo" "master" "$branch" \
	"$repo" "$copied_branch"
    separator

    echo "Pushing branch $copied_branch to github"
    separator
    (
	cd "$repo"
	git push origin -f "$copied_branch"
    )
    separator
}

main
