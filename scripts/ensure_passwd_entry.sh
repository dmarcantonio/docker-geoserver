#!/bin/bash
export USER=geoserveruser
export HOME=/home/geoserveruser
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER:-geoserveruser}:x:$(id -u):0:${USER:-geoserveruser} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

# See https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/
# See https://linuxize.com/post/etc-passwd-file/