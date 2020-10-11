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

# Window animations and Get Info animations
#defaults write com.apple.finder DisableAllAnimations -bool true

# Make hidden files visible
defaults write com.apple.finder AppleShowAllFiles -bool YES
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool YES
# Show path bar
defaults write com.apple.finder ShowPathbar -bool YES
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool YES
# Show tab view
defaults write com.apple.finder ShowTabView -bool YES

# Icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Text selection in Quick Look
#defaults write com.apple.finder QLEnableTextSelection -bool true

# Full POSIX path as window title
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# File extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Spring loaded directories
#defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Delay for spring loaded directories
#defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "None"

# Preferred view style
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
# After configuring preferred view style, clear all `.DS_Store` files
# to ensure settings are applied for every directory
# sudo find / -name ".DS_Store" -delete
# sudo find /Users -name ".DS_Store" -delete
# sudo find /Applications -name ".DS_Store" -delete
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable writing .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disk image verification
#defaults write com.apple.frameworks.diskimages skip-verify        -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
#defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
#defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
#defaults write com.apple.finder OpenWindowForNewRemovableDisk    -bool false

# Set icon view settings on desktop and in icon views
for view in 'Desktop' 'FK_Standard' 'Standard'; do
  # Item info near icons
  /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:showItemInfo bool true" ~/Library/Preferences/com.apple.finder.plist

  # Item info to right of icons
  /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:labelOnBottom bool false" ~/Library/Preferences/com.apple.finder.plist

  # Snap-to-grid for icons
  /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:arrangeBy string grid" ~/Library/Preferences/com.apple.finder.plist

  # Grid spacing for icons
  /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:gridSpacing integer 100" ~/Library/Preferences/com.apple.finder.plist

  # Icon size
  /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:iconSize integer 32" ~/Library/Preferences/com.apple.finder.plist
done

# View Options
# ColumnShowIcons    : Show preview column
# ShowPreview        : Show icons
# ShowIconThumbnails : Show icon preview
# ArrangeBy          : Sort by
#   dnam : Name
#   kipl : Kind
#   ludt : Date Last Opened
#   pAdd : Date Added
#   modd : Date Modified
#   ascd : Date Created
#   logs : Size
#   labl : Tags
#/usr/libexec/PlistBuddy \
#    -c "Set :StandardViewOptions:ColumnViewOptions:ColumnShowIcons bool    false" \
#    -c "Set :StandardViewOptions:ColumnViewOptions:FontSize        integer 11"    \
#    -c "Set :StandardViewOptions:ColumnViewOptions:ShowPreview     bool    true"  \
#    -c "Set :StandardViewOptions:ColumnViewOptions:ArrangeBy       string  dnam"  \
#    ~/Library/Preferences/com.apple.finder.plist

# Warning before emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely
defaults write com.apple.finder EmptyTrashSecurely -bool false

# AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Desktop Disable / Enabled desktop icons
# More: https://www.defaults-write.com/os-x-how-to-quickly-hide-the-desktop-icons/
# defaults write com.apple.finder CreateDesktop -bool false

# Restart Finder
killall Finder
echo 'Complete!'

# Execute installer script
cd installer && yarn install && cd ..
node ./installer/index.js

# Update terminal's color
# Terminal color comes from: https://ethanschoonover.com/solarized/
echo 'Almost done, now you need to update the colors...'
echo 'Click on "Preferences" -> "Profile" -> "Import" -> select "solarized-dark-ansi.terminal". Click on "Default" to set this as default profile.'
echo 'You are all set, close the terminal and re-open!'
