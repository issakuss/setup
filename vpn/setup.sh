#!/bin/sh

brew install openconnect
curl -O https://raw.githubusercontent.com/issakuss/setup/master/vpn/connect_to_atr.command
chmod 777 connect_to_atr.command
echo -n "Password for VPN: "
read PASS
sed -i '' -e "s/ENTERPASSWORDHERE/${PASS}/g" connect_to_atr.command
mv connect_to_atr.command /Applications/
