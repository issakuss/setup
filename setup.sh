#!/bin/sh

echo -n "Setup file version is 2.0.1.0\n"

echo -n "Install VPN? [Y/n]: "
read VPN

case $VPN in
  "" | [Yy]* )
    echo -n "Password for VPN: "
    read VPNPASS
    ;;
  * )
    ;;
esac

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/issakuss/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Git
brew install git
git config --global user.name issakuss
git config --global user.email issakuss@gmail.com

# Copy SSH
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/icloud
cp -rf ~/icloud/setup/ssh/ ~/.ssh/
chmod 600 ~/.ssh/id_rsa

# Clone dotfiles
cd ~/
git clone git@github.com:issakuss/dotfiles.git 
zsh dotfiles/setup.sh

# Get files
cd ~/Desktop
svn export https://github.com/issakuss/setup/branches/main/attaches ~/Desktop/attaches
cp ~/icloud/setup/attaches/ attaches

# VPN

# Install applications
sudo softwareupdate --install-rosetta
brew install uv
brew install openconnect
brew install issakuss/papnt/papnt
brew install google-japanese-ime
brew install docker
brew install docker-compose
brew install quarto
brew install --cask chatgpt
brew install --cask visual-studio-code
brew install --cask notion
brew install --cask notion-mail
brew install --cask notion-calendar
brew install --cask slack
brew install --cask google-chrome
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install --cask adobe-creative-cloud
brew install --cask adobe-creative-cloud-cleaner-tool
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask appcleaner
brew install --cask keyboard-cleaner
brew install --cask ogdesign-eagle
brew install --cask zoom
brew install --cask qlstephen
brew install --cask qlmarkdown

# Install Fonts
brew install --cask font-noto-sans-cjk-jp
brew install --cask font-ricty-diminished
mv ~/Desktop/attaches/font/* ~/Library/Fonts/

# Adobe settings
ln -s cp ~/icloud/picture/myswatch.ai /Applications/Adobe\ Illustrator\ 2023/Presets.localized/ja_JP/スウォッチ

# VPN settings
case $VPN in
  "" | [Yy]* )
    chmod 777 ~/Desktop/attaches/connect_to_atr.command
    mv ~/Desktop/attaches/connect_to_atr.command /Applications/
    sed -i '' -e "s/ENTERPASSWORDHERE/${VPNPASS}/g" /Applications/connect_to_atr.command
    ;;
  * )
    ;;
esac

# Docker settings
echo -n "Connect to ATR network? [Y/n]: "
read ATRNET
case $ATRNET in
  "" | [Yy]* )
    docker context create ncd10 --docker 'host=ssh://issakuss@ncd10'
    docker context use ncd10
    ;;
  * )
    ;;
esac

# Quicklook settings
## https://github.com/sindresorhus/quick-look-plugins
## https://github.com/whomwah/qlstephen
xattr -d -r com.apple.quarantine ~/Library/QuickLook
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r
qlmanage -r cache

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
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# cleanup
brew cleanup -s
echo -n "FINISH! REBOOT COMPUTER"