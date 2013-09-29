#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

sudo adduser --system $CENTRAL_USER --shell /bin/bash
sudo adduser --system $BITCOIN_USER --shell /bin/bash
