#!/bin/sh


crond -f &
crond_pid=$!

test -z "$GIT_BRANCH" && GIT_BRANCH=master

test -d ${GIT_URL}/.git || git clone ${GIT_URL} -b ${GIT_BRANCH} ${GIT_DIR}/

while `true`
do
  sleep 3600
done

# kill $crond_pid
