# Generating SSH key and configuring it
echo 'Generating SSH key and setting it up...'
ssh-keygen -t rsa -b 4096 -C $1
eval "$(ssh-agent -s)"
cp resources/.ssh_config ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
echo 'Complete!'
