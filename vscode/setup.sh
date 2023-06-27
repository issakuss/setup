#!/bin/sh

# Install
brew install --cask visual-studio-code

# Extensions
curl -O https://raw.githubusercontent.com/issakuss/setup/master/vscode/extensions.txt
cat extensions.txt | while read line
do
 code --install-extension $line
done

# Docker settings
brew install docker
echo -n "Connect to ATR network and press any key: "
read DMY
docker context create ncd10 --docker 'host=ssh://issakuss@ncd10'
docker context use ncd10

# macOS settings
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# Cleanup files
rm extensions.txt