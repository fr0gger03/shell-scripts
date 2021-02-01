#!/bin/bash

while true
do
  if [ `date +%H` -ge 18 ]; then
    exit # exit script
  fi
  echo
  echo This script will repeat until 6pm then exit.
  echo
  echo creating 500MB file
  echo
  dd if=/dev/urandom of=/tmp/largefile bs=1024 count=500000
  echo
  echo deleting 500MB file
  echo
done