#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

git clone dev.freegeek.org:/git/greenaddress-pos-tools/ greenaddress-pos-tools/
sudo apt-get install -y python-qrencode python-qt4 python-zmq python
sudo ln -sf $BASE/BitCoinPOS.desktop /usr/share/applications/
