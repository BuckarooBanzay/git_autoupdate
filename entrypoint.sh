#!/bin/sh

# initial update
echo "Executing initial update"
mkdir -p ${GIT_DIR}
/etc/periodic/minute/update

echo "Starting crond"
crond -f &
crond_pid=$!


while `true`
do
  sleep 3600
done

kill $crond_pid
