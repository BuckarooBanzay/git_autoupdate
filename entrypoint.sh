#!/bin/sh


crond -f &
crond_pid=$!

while `true`
do
  sleep 3600
done

# kill $crond_pid
