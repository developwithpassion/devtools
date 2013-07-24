#toggle desktop icon visibility to false
defaults write com.apple.finder CreateDesktop -bool false
#force the changes to refresh by restarting finder
killall Finder
