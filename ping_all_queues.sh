#!/bin/sh

BASE=$(dirname $(readlink -f $0))
. $BASE/lib.sh

run_remote_queue() {
    $BASE/my-queue-tx $@
}

for PORT in $(find_ports_listening $REMOTE_PORT_NUMBERS); do
    run_remote_queue $PORT $@
done
