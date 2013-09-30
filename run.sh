#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

do_end_stuff() {
if [ -n "$TUNNEL_PID" ]; then
    kill $TUNNEL_PID
fi
FIND_PID=$(ps aux | grep ensure_tunnel.sh | grep /bin/sh | awk '{print $2}')
if [ -n "$FIND_PID" ]; then
    kill $FIND_PID
fi
FIND_PID=$(ps aux | grep ssh | grep $SSH_KEY_FILE | awk '{print $2}')
if [ -n "$FIND_PID" ]; then
    kill $FIND_PID
fi
FIND_PID=$(ps aux | grep ensure_tunnel.sh | grep /bin/sh | awk '{print $2}')
if [ -n "$FIND_PID" ]; then
    kill -s 9 $FIND_PID
fi
FIND_PID=$(ps aux | grep ssh | grep $SSH_KEY_FILE | awk '{print $2}')
if [ -n "$FIND_PID" ]; then
    kill -s 9 $FIND_PID
fi
}

TUNNEL_PID=""
if [ -z "$(test_listening_on_port "$RPC_PORT_NUMBER")" ]; then
    $BASE/ensure_tunnel.sh &
    TUNNEL_PID=$!
fi

trap "do_end_stuff" EXIT
trap "do_end_stuff" 2
trap "do_end_stuff" 15

copy_with_secret $BASE/greenaddress-pos-tool.conf $HOME/.greenaddress-pos-tool
sed -n '/##/ p' $HOME/.greenaddress-pos-tool > $HOME/.greenaddress-pos-tool.README
sed -i '/##/ d' $HOME/.greenaddress-pos-tool

python $POS/pos-tool.py
