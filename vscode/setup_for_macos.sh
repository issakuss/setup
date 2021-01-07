#!/bin/sh

# Install
brew install --cask vscode

# PATH setting
$echo 'export PATH=/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH' >> ~/.zshrc

# Add to dotfiles
mkdir -p ~/dotfiles
cp -r dotfiles/ ~/dotfiles/

# settings
ln -s "~dotfiles/settings.json" "~/Library/Application\ Support/Code/User/settings.json"
ln -s "~dotfiles/keybindings.json" "~/Library/Application\ Support/Code/User/keybindings.json"

# extension
cat requirements.txt | while read line
do
 code --install-extension $line
done
