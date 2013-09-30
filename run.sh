#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

TUNNEL_PID=""
if [ -z "$(test_listening_on_port "$RPC_PORT_NUMBER")" ]; then
    $BASE/ensure_tunnel.sh &
    TUNNEL_PID=$!
fi

copy_with_secret $BASE/greenaddress-pos-tool.conf $HOME/.greenaddress-pos-tool
python $POS/pos-tool.py
if [ -n "$TUNNEL_PID" ]; then
    kill $TUNNEL_PID
    FIND_PID=$(ps aux | grep ssh | grep $SSH_KEY_FILE | awk '{print $2}')
    if [ -n "$FIND_PID" ]; then
	kill $FIND_PID
    fi
fi
