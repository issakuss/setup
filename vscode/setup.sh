#!/bin/sh

# Install
brew install --cask visual-studio-code

# Docker settings
brew install docker
echo -n "Connect to ATR network and press any key: "
read DMY
docker context create ncd10 --docker 'host=ssh://issakuss@ncd10'
docker context use ncd10

# macOS settings
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false