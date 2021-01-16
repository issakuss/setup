#!/bin/sh

# Install
brew install --cask visual-studio-code

# PATH setting
echo 'export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH' >> ~/.zshrc

# Copy files
svn export https://github.com/issakuss/setup/branches/master/vscode/dotfiles/attaches

# Add to dotfiles
mkdir -p ~/dotfiles
cp -r dotfiles/ ~/dotfiles/

# Settings
ln -s ~/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

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

# Cleanup files
rm -rf attaches