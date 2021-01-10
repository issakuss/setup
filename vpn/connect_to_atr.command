#!/bin/sh

echo "${PASS}" | sudo openconnect -u issakuss --passwd-on-stdin vpngw-ng.atr.jp
