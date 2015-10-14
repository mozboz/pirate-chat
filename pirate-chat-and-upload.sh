#!/bin/bash


# --- Config

# Directory to store/serve files from. Probably better to change this to absolute path!
FILE_FOLDER="file-server/filestore"

IMAGE="droopy/piratebox-logo-small.png"

HOST="localhost"

TEXT="<b>1.</b> Learn more about the project <a href=\"http://$HOST:8001/.READ.ME.htm\" target=\"_parent\"><b>here</b></a>.<p><b>2.</b> Click button below to begin sharing.</p><b>3.</b> Browse and download files <a href=\"http://$HOST:8001\" target=\"_parent\"><b>here</b></a>.<br>"

CHAT_BOX_HTML="<iframe height='400px' width='50%' frameBorder='0' scrolling='0'  src='http://$HOST:8002'></iframe>"

#Forum_LInk
#  If you want to enable Forum run 
#          /opt/piratebox/bin/install_piratebox.sh /opt/piratebox/conf/piratebox.conf  pyForum
FORUM_LINK_HTML=""
#FORUM_LINK_HTML="<a href='http://$HOST:8002/cgi-bin/forest.py' title='Piratebox Forum'>Enter Forum</a>";


## Includes additions things to droopy welcome page
DROOPY_INCLUDE="$FORUM_LINK_HTML <br /> $CHAT_BOX_HTML"

## Start chat server
./chat-server.sh &
echo $!

## Start file server
./file-server.sh &
echo $!

## Start droopy
python droopy.py -d $FILE_FOLDER -p $IMAGE -m "$TEXT"  -c "$DROOPY_INCLUDE" &
echo $!

