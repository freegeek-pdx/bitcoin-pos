#!/bin/sh

REMOTE_HOST="asdf"
KEY_FILE="/asdf/"
PORT_NUMBER="8332"

while echo "Connecting to remote host $REMOTE_HOST for port $PORT_NUMBER..."; do
    ssh -i $KEY_FILE -N -L $PORT_NUMBER:127.0.0.1:$PORT_NUMBER $REMOTE_HOST
done
