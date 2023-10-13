#!/bin/sh

echo -n "Setup file version is $(cat VERSION)\n"

echo -n "Password to unzip: "
read PASS

echo -n "Install VPN? [Y/n]: "
read VPN

# Install installers
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/Desktop

brew install git git-lfs
brew install svn
git config --global user.name issakuss
git config --global user.email issakuss@gmail.com

# SSH setting
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/icloud
cp -rf ~/icloud/ssh/ ~/.ssh/
chmod 600 ~/.ssh/id_rsa

# dotfiles
cd ~/
git clone git@github.com:issakuss/dotfiles.git 
zsh dotfiles/setup.sh
cd ~/Desktop

# Get files
svn export https://github.com/issakuss/setup/branches/master/macos/attaches
cd attaches 
cp ~/icloud/private-setup.zip private-setup.zip
unzip -P $PASS private-setup.zip

# Install applications
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/issakuss/setup/master/adobe/setup.sh)"
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/issakuss/setup/master/vscode/setup.sh)"
brew install --cask notion
brew install issakuss/papnt/papnt
brew install --cask slack
brew install --cask google-chrome
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install docker
brew install docker-compose
brew install --cask docker
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask appcleaner
brew install --cask keyboard-cleaner
brew install --cask ogdesign-eagle
brew install --cask zoom
brew install --cask qlstephen
brew install --cask qlmarkdown

case $VPN in
  "" | [Yy]* )
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/issakuss/setup/master/vpn/setup.sh)"
    ;;
  * )
    ;;
esac

# Install Font
cp -r private/font/ ~/Library/Fonts/

# Application settings
## https://github.com/sindresorhus/quick-look-plugins
## https://github.com/whomwah/qlstephen
xattr -d -r com.apple.quarantine ~/Library/QuickLook
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r
qlmanage -r cache

## BetterTouchTool (Use manually)
cp private/license.bettertouchtool ~/Downloads/
cp mysetting_bettertouchtool.json ~/Downloads/

## Workflows (Use manually)
cp private/maildrop.workflow.zip ~/Downloads
cp workflow.workflow.zip ~/Downloads

# macOS settings
chflags nohidden ~/Library
sudo chflags nohidden /Volumes
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write com.apple.screencapture show-thumbnail -bool false
defaults write com.apple.dock autohide -bool true
defaults write -g com.apple.mouse.tapBehavior -int 1
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.mail minSizeKB 3000

# cleanup
cd ../
rm -rf attaches
brew cleanup -s
echo -n "FINISH! REBOOT COMPUTER"