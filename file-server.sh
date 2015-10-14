#!/bin/sh

if [ -n "$1" ]
  then
    cd $1
    exec python ../file-server.py 8001
  else
    exec python file-server.py 8001
fi


