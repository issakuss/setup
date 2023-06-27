#!/bin/sh

set -eu
trap catch ERR
function catch {
    sudo killall -SIGINT openconnect
    echo "------ Connection killed ------"
}

PASS="ENTERPASSWORDHERE"
echo "${PASS}" | sudo openconnect -u issakuss --passwd-on-stdin vpngw-ng.atr.jp 