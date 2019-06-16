# Setup Homebrew
echo 'Installing HomeBrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Make sure installation is good
brew doctor
echo 'Complete!'

# Install git
echo 'Installing Git...'
brew install git
echo 'Complete!'

# Installing ZSH
echo 'Installing ZSH...'
brew install zsh
echo 'Complete!'

# Installing Oh-My-Zsh
echo 'Installing Oh-My-ZSH...'
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp resources/.zshrc ~/.zshrc
# Make ZSH default shell
chsh -s /bin/zsh
echo 'Complete!'

# Change to ZSH shell and continue with the script
/bin/zsh setup-2.sh
