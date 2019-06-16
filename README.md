# Thiago Festa's Dotfiles

## Installation

Run `setup.sh` and it will do all the hard work...

### You are done!

## What will be installed?

This is executed in the order bellow:

- HomeBrew
- Git
- ZSH
- OhMyZSH
- NVM
- Latest Node LTS
- Yarn
- Configure Finder

## How it works

When running `setup.sh` it runs `scripts/setup-1.sh`.

`scripts/setup-1.sh` installs HomeBrew, git, zsh and oh-my-zsh, then runs zsh with `scripts/setup-2.sh` to proceed with the setup.

`scripts/setup-2.sh` installs nvm, lastest node lts, yarn, set up Finder and execute `installer` which prompts you with what to configure / install.

### Folders

- `installer` - It has a javascript app that asks questions so you can customize your setup.
- `resources` - The resources, files that will be copied to your new setup.
- `scripts` - Small scripts that are executed.
