#!/bin/sh
test -d "$GIT_DIR" || exit
cd $GIT_DIR

test -z "$GIT_BRANCH" && GIT_BRANCH=master

function update_submodules() {
	echo "Updating submodules"
	unset GIT_DIR
	# sync repo urls
	git submodule sync
	# initialize new repos
	git submodule init
	# update commits
	git submodule update
	# remove unversioned files
	git clean -dff
}

# initial clone
test -d ${GIT_URL}/.git || {
	echo "Doing an initial clone"
	git clone ${GIT_URL} -b ${GIT_BRANCH} ${GIT_DIR}/
	update_submodules
}

# remove GIT_DIR global
unset GIT_DIR

git remote update
git diff --exit-code HEAD origin/$GIT_BRANCH && exit

echo "updating repository"

# pull branch
git pull origin $GIT_BRANCH

test -f .gitmodules && update_submodules

echo "Update complete!"
