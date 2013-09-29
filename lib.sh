. $BASE/scripts.conf

SSH_KEY_FILE="$BASE/tunnel_key"
POS=$BASE/greenaddress-pos-tools
BITCOIN=$HOME/.bitcoin/
RPC_PORT_NUMBER="8332"
LOCAL_PORT="15556"
SECRET_FILE=$BASE/secret.conf

if [ ! -e "$SECRET_FILE" ]; then
    echo "Please create $SECRET_FILE with a shared secret set as SECRET"
    echo "Exiting"
    exit 1
else
    . $SECRET_FILE
fi

copy_with_secret() {
    if [ -e "$2" ]; then
	mv $2 ${2}.bak
    fi
    echo '## NOTE: This configuration file is automatically generated.' > $2
    echo '##       If you make changes, they will be overwritten daily.' >> $2
    echo "##" >> $2
    echo '##       If you need to make a change to this file persistent,' >> $2
    echo "##       please have Free Geek's Technocrats fix the original." >> $2
    echo '##' >> $2
    cat $1 | sed "s,%SECRET%,${SECRET},g" >> $2
}

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
