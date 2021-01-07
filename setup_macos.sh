#!/bin/sh

zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
zsh -c "$(curl -fsSL https://github.com/issakuss/setup/vscode/setup_for_macos.sh)"

brew install mas
brew install git git-lfs

brew install --cask google-chrome
brew install --cask opera
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install --cask evernote
brew install --cask google-japanese-ime
brew install --cask adobe-creative-cloud
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask microsoft-onedrive
brew install --cask atom
brew install --cask appcleaner
brew install --cask dropbox
brew install --cask qlstephen
brew install --cask qlmarkdown

# https://github.com/sindresorhus/quick-look-plugins
# https://github.com/whomwah/qlstephen
xattr -d -r com.apple.quarantine ~/Library/QuickLook
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r
qlmanage -r cache
killall Finder

mas install 803453959 # Slack
mas install 409183694 # Keynote

ln -s ~/Dropbox/ssh/ ~/.ssh
