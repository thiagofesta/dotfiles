# Setup Homebrew
echo 'Installing HomeBrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Make sure installation is good
brew doctor
echo 'Complete!'

# Install and configuring git
echo 'Installing and configuring Git...'
brew install git
git config --global user.name "Thiago Festa"
git config --global user.email "thiagofesta@gmail.com" 
git config --global core.excludesfile $HOME/.gitignore_global
cp .gitignore_global $HOME/.gitignore_global
echo 'Complete!'

# Generating SSH key and configuring it
echo 'Generating SSH key and setting it up...'
ssh-keygen -t rsa -b 4096 -C "thiagofesta@gmail.com"
eval "$(ssh-agent -s)"
cp .ssh_config ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
echo 'Complete!'

# Installing ZSH
echo 'Installing ZSH...'
brew install zsh
echo 'Complete!'

# Installing Oh-My-Zsh
echo 'Installing Oh-My-ZSH...'
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp .zshrc ~/.zshrc
# Make ZSH default shell
chsh -s /bin/zsh
echo 'Complete!'

# Installing essentials
echo 'Installing nvm, latest lts node and yarn'
brew install nvm
mkdir ~/.nvm
source ~/.zshrc
nvm install --lts
brew install yarn
echo 'Complete!'

# Installing yarn globals
echo 'Installing global NPM packages...'
yarn global add http-server
echo 'Complete!'

# Install macOS packages
echo 'Installing macOS packages...'
brew install cask
brew cask install google-chrome
brew cask install firefox
brew cask install alfred
brew cask install spectacle
brew cask install spotify
brew cask install slack
brew cask install dropbox
brew cask install 1password
# brew cask install sublime-text
# brew cask install atom
brew cask install visual-studio-code
brew cask install vlc
brew cask install the-unarchiver
brew cask install whatsapp
brew cask install yakyak
echo 'Complete!'

# Update terminal's color
# Terminal color comes from: https://ethanschoonover.com/solarized/
echo 'Almost done, now you need to update the colors...'
echo 'Click on "Preferences" -> "Profile" -> "Import" -> select "solarized-dark-ansi.terminal". Click on "Default" to set this as default profile.'
echo 'You are all set, close the terminal and re-open!'
