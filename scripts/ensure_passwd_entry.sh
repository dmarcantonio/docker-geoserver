#!/bin/bash
export USER_NAME=geoserveruser
export HOME=/home/geoserveruser
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-geoserveruser}:x:$(id -u):0:${USER_NAME:-geoserveruser} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi