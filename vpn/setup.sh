#!/bin/sh

curl -O https://raw.githubusercontent.com/issakuss/setup/master/vscode/connect_to_atr.command
chmod 777 connect_to_atr.command
echo -n "Password for VPN: "
read PASS
sed -i '2s/^/PASS=${PASS}/' connect_to_atr.command
mv connect_to_atr.command /Applications/
