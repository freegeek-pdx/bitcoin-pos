#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

REINDEX=""
if [ ! -e "$BITCOIN" ]; then
    mkdir -p "$BITCOIN"
    REINDEX="-reindex"
fi
ln -sf $BASE/bitcoin.conf $HOME/.bitcoin/bitcoin.conf

bitcoind $REINDEX -walletnotify="$BASE/ping_all_queues.sh %s" &
