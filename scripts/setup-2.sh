# Installing essentials
echo 'Installing nvm, latest node lts and yarn'
brew install nvm
mkdir ~/.nvm
source ~/.zshrc
nvm install --lts
brew install yarn
echo 'Complete!'

# Set up Finder
echo 'Setting up Finder...'
# Fix antialising issue on mohave (https://www.cleverfiles.com/help/mac-fonts-text-blurry.html)
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
# Make hidden files visible
defaults write com.apple.finder AppleShowAllFiles -bool YES
# Show path bar
defaults write com.apple.finder ShowPathbar -bool YES
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool YES
# Show tab view
defaults write com.apple.finder ShowTabView -bool YES
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool YES
# Restart Finder
killall Finder
echo 'Complete!'

# Execute installer script
node ./installer/index.js

# Update terminal's color
# Terminal color comes from: https://ethanschoonover.com/solarized/
echo 'Almost done, now you need to update the colors...'
echo 'Click on "Preferences" -> "Profile" -> "Import" -> select "solarized-dark-ansi.terminal". Click on "Default" to set this as default profile.'
echo 'You are all set, close the terminal and re-open!'
