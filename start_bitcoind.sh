#!/bin/sh

BASE=$(dirname $(readlink -f $0))
BITCOIN=$HOME/.bitcoin/
# FIXME
POS=$BASE/greenaddress-pos-tools

REINDEX=""
if [ ! -e "$BITCOIN" ]; then
    mkdir -p "$BITCOIN"
    REINDEX="-reindex"
fi
ln -sf $BASE/bitcoin.conf $HOME/.bitcoin/bitcoin.conf

bitcoind $REINDEX -walletnotify="$POS/utils/queue-tx %s" &
