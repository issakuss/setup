#!/bin/sh

# Install
brew install --cask visual-studio-code

# Extensions
cat extensions.txt | while read line
do
 code --install-extension $line
done

# Docker settings
brew install docker
echo -n "Connect to ATR network and press any key: "
read DMY
docker context create remote --docker 'host=ssh://issakuss@ncd4'
docker context use remote

# macOS settings
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# Cleanup files
rm -rf attaches
