'use strict';
const inquirer = require('inquirer');
const shell = require('shelljs');

async function askGitConfiguration() {
  return inquirer.prompt([
    {
      type: 'confirm',
      message: 'Do you want to configure Git?',
      name: 'confirm',
      default: true
    },
    {
      type: 'input',
      message: 'What\'s your name (for git config user.name)?',
      name: 'name',
      default: 'Thiago Festa',
      when(answers) {
        return answers.confirm;
      }
    },
    {
      type: 'input',
      message: 'What\'s your email (for git config user.email)?',
      name: 'email',
      default: 'thiagofesta@gmail.com',
      when(answers) {
        return answers.confirm;
      }
    }
  ]);
}

async function askCreateSSHKey() {
  return inquirer.prompt([
    {
      type: 'confirm',
      message: 'Do you want to create an SSH Key?',
      name: 'confirm',
      default: true
    },
    {
      type: 'input',
      message: 'What\'s your email?',
      name: 'email',
      default: 'thiagofesta@gmail.com',
      when(answers) {
        return answers.confirm;
      }
    }
  ]);
}

async function askNPMPackages() {
  return inquirer.prompt([
    {
      type: 'checkbox',
      message: 'Select the NPM packages to install globally',
      name: 'packages',
      pageSize: 50,
      choices: [
        {
          name: 'http-server',
          checked: true
        }
      ]
    }
  ]);
}

async function askMacOSPackages() {
  return inquirer.prompt([
    {
      type: 'checkbox',
      message: 'Select the NPM packages to install globally',
      name: 'packages',
      pageSize: 50,
      choices: [
        new inquirer.Separator(' = Browsers = '),
        {
          name: 'google-chrome',
          checked: true
        },
        {
          name: 'firefox',
          checked: true
        },
        new inquirer.Separator(' = Code Editors = '),
        {
          name: 'visual-studio-code',
          checked: true
        },
        {
          name: 'sublime-text',
          checked: false
        },
        {
          name: 'atom',
          checked: false
        },
        new inquirer.Separator(' = Communication = '),
        {
          name: 'slack',
          checked: true
        },
        {
          name: 'telegram',
          checked: true
        },
        {
          name: 'whatsapp',
          checked: true
        },
        {
          name: 'yakyak',
          checked: true
        },
        new inquirer.Separator(' = Essentials = '),
        {
          name: '1password',
          checked: true
        },
        {
          name: 'alfred',
          checked: true
        },
        {
          name: 'dropbox',
          checked: true
        },
        {
          name: 'recordit',
          checked: true
        },
        {
          name: 'spectacle',
          checked: true
        },
        {
          name: 'spotify',
          checked: true
        },
        {
          name: 'the-unarchiver',
          checked: true
        },
        {
          name: 'vlc',
          checked: true
        },
        new inquirer.Separator(' = Development = '),
        {
          name: 'postman',
          checked: true
        }
      ]
    }
  ]);
}

(async function() {
  const gitConfiguration = await askGitConfiguration();
  if (gitConfiguration && gitConfiguration.confirm) {
    shell.exec(`./scripts/git-configuration.sh "${gitConfiguration.name}" "${gitConfiguration.email}"`);
  }

  const createSSHKey = await askCreateSSHKey();
  if (createSSHKey && createSSHKey.confirm) {
    shell.exec(`./scripts/create-ssh-key.sh "${createSSHKey.email}"`);
  }

  const NPMPackages = await askNPMPackages();
  if(NPMPackages && NPMPackages.packages.length > 0) {
    shell.exec(`yarn global add ${NPMPackages.packages.join(' ')}`);
  }

  const macOSPackages = await askMacOSPackages();
  if(macOSPackages && macOSPackages.packages.length > 0) {
    shell.exec(`brew cask install ${macOSPackages.packages.join(' ')}`);
  }

  // ToDo: Add VSCODE
})();
