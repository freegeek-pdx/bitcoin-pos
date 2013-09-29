#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

PUBKEY=$SSH_KEY_FILE.pub
AUTHKEY=$SSH_KEY_FILE.authorized_keys

ssh-keygen -f $SSH_KEY_FILE -N ""
PUB=$(cat $PUBKEY)
cat - > $AUTHKEY <<EOF
command="echo 'This account can only be used for remote bitcoind access.'",no-agent-forwarding,no-X11-forwarding $PUB
EOF
ssh-copy-id -i $AUTHKEY $CENTRAL_USER@$CENTRAL_SERVER
