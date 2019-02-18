#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; fill-column: 80; -*-
#
# getrtt.sh
# Created by Balakrishnan Chandrasekaran on 2019-02-17 18:56 +0100.
# Copyright (c) 2017 Balakrishnan Chandrasekaran <balakrishnan.c@gmail.com>.
#

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function err() {
    echo "Error: $1" >& 2
    exit 1
}


readonly CURL=`which curl`
[ -z "$CURL" ] && err 'Unable to find `curl` in PATH!'

readonly CONF="$DIR/conf"
[ -z "$CONF" ] && err "Unable to find config: $CONF"

readonly RTT="$DIR/rtt.awk"
[ -z "$RTT" ] && err "Unable to find awk file: $RTT"


function show_usage() {
    echo "Usage: $0 <URL>" >& 2
}

[ $# -ne 1 ] && show_usage && exit 1

$CURL -sSLo /dev/null -K "$CONF" "$1" | awk -f "$RTT"
