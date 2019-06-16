# Configuring git
echo "Configuring Git with name: $1 and email $2..."
git config --global user.name $1
git config --global user.email $2
git config --global core.excludesfile $HOME/.gitignore_global
cp resources/.gitignore_global $HOME/.gitignore_global
echo 'Complete!'
