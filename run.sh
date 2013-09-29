#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

ln -sf $BASE/greenaddress-pos-tool.conf $HOME/.greenaddress-pos-tool
python $POS/pos-tool.py
