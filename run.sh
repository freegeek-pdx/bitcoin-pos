#!/bin/sh

BASE=$(dirname $(readlink -f $0))
POS=$BASE/greenaddress-pos-tools

ln -sf $BASE/greenaddress-pos-tool.conf $HOME/.greenaddress-pos-tool
python $POS/pos-tool.py
