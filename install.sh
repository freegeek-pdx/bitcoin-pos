#!/bin/sh

git submodule update --init greenaddress-pos-tools/
sudo apt-get install -y python-qrencode python-qt4 python-zmq python
