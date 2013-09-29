#!/bin/sh

PORT_NUMBERS="15556"
BASE=$(dirname $(readlink -f $0))

. $BASE/lib

run_remote_queue() {
    $BASE/my-queue-tx $@
}

for PORT in $(find_ports_listening $PORT_NUMBERS); do
    run_remote_queue $PORT $@
done
