say "THE PORN YOU REQUESTED IS BEING DOWNLOADED TO YOUR PORN STASH"
sysctl -n machdep.cpu.brand_string

defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
sudo pmset -a sms 0 #disable sudden motion sensor
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.BezelServices kDimTime -int 300
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write NSGlobalDomain AppleFontSmoothing -int 2
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari ProxiesInBookmarksBar "()"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

sudo systemsetup -setremotelogin on

say "Install some coding stuff"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install caskroom/cask/brew-cask

brew install ack bash bash-completion freetds freetype git imagemagick leiningen mysql netcat nmap node openssl postgresql redis sbcl sqlite vim wget
brew install sphinx --mysql
brew cask install virtualbox vagrant google-chrome google-drive google-hangouts iterm2 slack 1password vlc transmission appcleaner the-unarchiver

brew cleanup

# More pre-install config
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
