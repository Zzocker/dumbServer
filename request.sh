#!/bin/bash

set -e

PROTOCOL="http"
IP="localhost"
PORT="8080"
ENDPOINT="/"

BENCH_TIME=1000 # seconds
BENCH_CONC=3000


TSV_FOLDER_PATH="./tsvfiles"

function make_request(){
    LANG=$1
    echo "==============================================================================================="
    echo "$LANG"
    echo "==============================================================================================="
    ab -t "$BENCH_TIME" -c "$BENCH_CONC" -g "$TSV_FOLDER_PATH/$LANG.tsv" "$PROTOCOL://$IP:$PORT$ENDPOINT"
}

if [ ! "$#" -eq 2 ];then
echo "invaild input"
echo "<ip_of_server> <server_name>"
exit 1
fi

IP=$1

make_request $2