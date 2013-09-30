#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

git submodule update --init greenaddress-pos-tools/
sudo apt-get install -y python-qrencode python-qt4 python-zmq python
ln -sf $BASE/BitCoinPOS.desktop /usr/share/applications/
