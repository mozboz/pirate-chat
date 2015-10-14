#!/bin/sh

if [ -n "$1" ]
  then
    cd $1
    CHAT_PATH="../"
  else
    CHAT_PATH=""
fi

if ! [ -d "cgi-bin" ]
  then
    echo "Directory must contain cgi-bin"
    exit 1
fi

CHAT_PATH=$CHAT_PATH"chat-server.py"

exec python $CHAT_PATH

