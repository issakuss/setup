#!/bin/sh

brew install --cask zotero
brew install jq
cd ~/Desktop
curl -s https://api.github.com/repos/retorquere/zotero-better-bibtex/releases/latest | jq '.assets[0].browser_download_url' | xargs curl -L -O

cd ~/
brew uninstall jq