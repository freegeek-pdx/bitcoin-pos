#!/bin/sh

### BEGIN INIT INFO
# Provides:		bitcoind
# Required-Start:	$remote_fs
# Required-Stop:	$remote_fs
# Default-Start:	2 3 4 5
# Default-Stop:	0 1 6
# Short-Description:	BitcoinD
### END INIT INFO

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

set -e

case "$1" in
    start)
	start-stop-daemon --start --background --oknodo --user $BITCOIN_USER --name bitcoind --chuid $BITCOIN_USER --exec $BASE/start_bitcoind.sh 
	;;
    stop)
	start-stop-daemon --stop --oknodo --user $BITCOIN_USER --name bitcoind 
	;;   
    restart|reload)
	$0 stop
	$0 start
	;;
    *)
	;;
esac
