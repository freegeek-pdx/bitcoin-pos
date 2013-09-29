#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

if [ -n "$(test_listening_on_port "$RPC_PORT_NUMBER")" ]; then
    echo "Note: $0 is already running, exiting"
    exit 0
fi

while echo "Connecting to remote host $CENTRAL_SERVER for port $RPC_PORT_NUMBER..."; do
    ssh -i $SSH_KEY_FILE -N -L $RPC_PORT_NUMBER:127.0.0.1:$RPC_PORT_NUMBER -R $MY_REMOTE_PORT:127.0.0.1:$LOCAL_PORT $CENTRAL_USER@$CENTRAL_SERVER
done
