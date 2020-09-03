#!/bin/bash


set -e

SERVER_FOLDER_FORMAT="Server"

DOCKER_BASE="zzocker20/dumb/"

function check_server_folder(){
    LANG=$1
    SERVER_FOLDER=$2
    if [ ! -d "./$SERVER_FOLDER$SERVER_FOLDER_FORMAT" ];then
    echo "Error : 404"
    echo "$SERVER_FOLDER server folder not found"
    exit 1
    fi

    set +e
    which "$LANG"
    if [ ! "$?" -eq 0 ];then
    echo "$LANG is not installed"
    exit 1
    fi
}


case $1 in

    "go")
    check_server_folder "go" "go"
    echo "========================================================================"
    echo "starting go server"
    echo "========================================================================"
    go run "go$SERVER_FOLDER_FORMAT/main.go"
    ;;

    "gofast")
    check_server_folder "go" "gofast"
    echo "========================================================================"
    echo "starting gofast server"
    echo "========================================================================"
    go run "gofast$SERVER_FOLDER_FORMAT/main.go"
    ;;

    "node")
    check_server_folder "node" "node"
    echo "========================================================================"
    echo "starting node server"
    echo "========================================================================"
    node "node$SERVER_FOLDER_FORMAT/index.js"
    ;;

    "express")
    check_server_folder "node" "express"
    echo "========================================================================"
    echo "starting express server"
    echo "========================================================================"
    node "express$SERVER_FOLDER_FORMAT/index.js"
    ;;

    "*")
    echo "invaild server name"
    exit 1
    ;;
esac
