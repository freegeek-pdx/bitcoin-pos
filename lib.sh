. $BASE/scripts.conf

SSH_KEY_FILE="$BASE/tunnel_key"
POS=$BASE/greenaddress-pos-tools
BITCOIN=$HOME/.bitcoin/
RPC_PORT_NUMBER="8332"
LOCAL_PORT="15556"

find_ports_listening() {
    for TEST_PORT in "$@"; do
	test_listening_on_port "$TEST_PORT"
    done
}

test_listening_on_port() {
    TEST_THIS_PORT="$1"
    if netstat -tln | awk '{print $4}' | grep -q ":${TEST_THIS_PORT}$"; then
	echo "$TEST_THIS_PORT"
    fi
}
