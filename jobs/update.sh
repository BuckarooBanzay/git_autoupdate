#!/bin/sh
test -d "$GIT_DIR" || exit
cd $GIT_DIR

test -z "$GIT_BRANCH" && GIT_BRANCH=master

git remote update
git diff --exit-code HEAD origin/$GIT_BRANCH && exit

echo "updating repository"

# pull branch
git pull origin $GIT_BRANCH

echo "Update complete!"
