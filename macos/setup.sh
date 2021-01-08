#!/bin/sh
echo -n "Version: 17 \n"
echo -n "Install VPN? [Y/n]: "
read VPN
echo -n "M1 Mac? [Y/n]: "
read M1

# Install installers
case $M1 in
  "" | [Yy]* )
    softwareupdate --install-rosetta
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/issakuss/m1brew/setup.sh)"
    cd ~/Desktop
    ;;
  * )
    #zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    cd ~/Desktop
    ;;
esac

brew install mas
brew install git git-lfs
brew install svn
git config --global user.name issakuss
git config --global user.email issakuss@gmail.com

# Get files
svn export https://github.com/issakuss/setup/branches/master/attaches
cd attaches 
unzip private.zip

# Add to dotfiles
mkdir -p ~/dotfiles
cp -r dotfiles/ ~/dotfiles/

# Install applications
brew install vim
brew install --cask google-chrome
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install --cask evernote
brew install --cask google-japanese-ime
brew install --cask adobe-creative-cloud
#brew install --cask microsoft-word
#brew install --cask microsoft-excel
#brew install --cask microsoft-powerpoint
Brew install --cask microsoft-onedrive
brew install --cask appcleaner
brew install --cask dropbox
brew install --cask qlstephen
brew install --cask qlmarkdown

mas install 803453959 # Slack
mas install 409183694 # Keynote

case $VPN in
  "" | [Yy]* )
    brew install openconnect
    ;;
  * )
    ;;
esac

#zsh -c "$(curl -fsSL https://raw.githubusercontent.com/issakuss/setup/master/vscode/setup_for_macos.sh)" # VScode

# Install Font
cp private/font ~/Library/Fonts

# Application settings
## https://github.com/sindresorhus/quick-look-plugins
## https://github.com/whomwah/qlstephen
xattr -d -r com.apple.quarantine ~/Library/QuickLook
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r
qlmanage -r cache
killall Finder

## BetterTouchTool (Use manually)
cp private/license.bettertouchtool ~/Downloads/
cp mysetting_bettertouchtool.json ~/Downloads/

## Karabiner
ln -s ~/dotfiles/.config ~/.config

# macOS settings
chflags nohidden ~/Library  # ~/Library ディレクトリを見えるようにする
sudo chflags nohidden /Volumes  # /Volumes ディレクトリを見えるようにする
defaults write NSGlobalDomain AppleShowAllExtensions -bool true  # 全ての拡張子のファイルを表示する
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true  # ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true  # USBに .DS_Store ファイルを作成しない
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false  # 拡張子変更時の警告を無効化する
defaults write com.apple.finder QLEnableTextSelection -bool true  # パスバーを表示する
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3  # Tabでボタンフォーカス切り替え
defaults write com.apple.screencapture show-thumbnail -bool false  # フローティングサムネールスキップ
defaults write com.apple.dock autohide -bool true  # Dockを自動的に非表示
defaults write -g com.apple.mouse.tapBehavior -int 1  # タップをクリックとして扱う
defaults write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 0  # ４本指でスクリーン間スワイプ
defaults write -g com.apple.trackpad.threeFingerVertSwipeGesture -int 0  # ４本指でMission Control/Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true  # アプリケーションExpose有効

# Other settings
#ln -s ~/Dropbox/ssh/ ~/.ssh  # ssh to NCD-NODE

# cleanup
cd ../
rm -rf attaches
