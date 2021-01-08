#!/bin/sh

# Install
brew install --cask visual-studio-code

# PATH setting
echo 'export PATH=/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH' >> ~/.zshrc

# Copy files
svn export https://github.com/issakuss/setup/branches/master/vscode
cd vscode

# Add to dotfiles
mkdir -p ~/dotfiles
cp -r dotfiles/ ~/dotfiles/

# Settings
ln -s ~/dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Extensions
cat requirements.txt | while read line
do
 code --install-extension $line
done

# Cleanup files
cd ../
rm -rf vscode
