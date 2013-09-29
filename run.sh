#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

$BASE/ensure_tunnel.sh & 

copy_with_secret $BASE/greenaddress-pos-tool.conf $HOME/.greenaddress-pos-tool
python $POS/pos-tool.py
