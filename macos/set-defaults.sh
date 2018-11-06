# Sets reasonable macOS defaults.

echo "Disable the sudden motion sensor as it's not useful for SSDs"
sudo pmset -a sms 0

echo "Disable press-and-hold for keys in favor of key repeat."
defaults write -g ApplePressAndHoldEnabled -bool false
echo "Show File Extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "Set a really fast key repeat."
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Show hidden files"
defaults write com.apple.finder AppleShowAllFiles YES
echo "Always open everything in Finder's list view. This is important."
defaults write com.apple.finder FXPreferredViewStyle Nlsv

echo "Show battery percentage in menu bar"
defaults write com.apple.menuextra.battery ShowPercent -string YES;

echo "Use AirDrop over every interface. srsly this should be a default."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

echo "Save screenshots in PNG format"
defaults write com.apple.screencapture type -string "png"

echo "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0
echo "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo "Make iterm2 use the config saved in this dotfiles"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
