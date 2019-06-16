# Installing the main required plugins
echo 'Installing plugins...'
# Install IntelliJ Keybindings
code --install-extension k--kato.intellij-idea-keybindings
# Install IntelliJ Theme
code --install-extension trinm1709.dracula-theme-from-intellij
# Install Editor Config
code --install-extension EditorConfig.EditorConfig
echo 'Complete!'

# Other plugins that are nice to have
# Firebase
# code --install-extension toba.vsfire
# Cordova tools
# code --install-extension vsmobile.cordova-tools

# Copy the settings
echo 'Copying the settings...'
cp resources/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
cp resources/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
echo 'Complete!'
