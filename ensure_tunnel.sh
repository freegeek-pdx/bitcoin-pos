#!/bin/sh

REMOTE_HOST="asdf"
KEY_FILE="/asdf/"
PORT_NUMBER="8332"

MY_REMOTE_PORT="15556"
LOCAL_PORT="15556"

BASE=$(dirname $(readlink -f $0))

. $BASE/lib

if [ -n "$(test_listening_on_port "$PORT_NUMBER")" ]; then
    echo "Note: $0 is already running, exiting"
    exit 0
fi

while echo "Connecting to remote host $REMOTE_HOST for port $PORT_NUMBER..."; do
    ssh -i $KEY_FILE -N -L $PORT_NUMBER:127.0.0.1:$PORT_NUMBER -R $MY_REMOTE_PORT:127.0.0.1:$LOCAL_PORT $REMOTE_HOST
done
