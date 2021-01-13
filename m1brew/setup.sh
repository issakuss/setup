#!/bin/sh

softwareupdate --install-rosetta
xcode-select --install
echo -n "Install XCode and any key to continue"
read DMY
sudo mkdir /opt/homebrew
sudo chown issakuss /opt/homebrew
cd /opt
sudo curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
sudo echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
sudo echo 'export HOMEBREW_CACHE=/opt/homebrew/cache' >> ~/.zshrc
