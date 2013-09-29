#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

REINDEX=""
if [ ! -e "$BITCOIN" ]; then
    mkdir -p "$BITCOIN"
    REINDEX="-reindex"
fi
copy_with_secret $BASE/bitcoin.conf $HOME/.bitcoin/bitcoin.conf

bitcoind $REINDEX -walletnotify="$BASE/ping_all_queues.sh %s" &
