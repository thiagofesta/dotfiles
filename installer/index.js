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
      message: 'Select the MacOS apps to install',
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
          name: 'discord',
          checked: true
        },
        {
          name: 'slack',
          checked: true
        },
        {
          name: 'signal',
          checked: true
        },
        {
          name: 'telegram',
          checked: false
        },
        {
          name: 'whatsapp',
          checked: true
        },
        {
          name: 'yakyak',
          checked: false
        },
        {
          name: 'zoomus',
          checked: true
        },
        new inquirer.Separator(' = Essentials = '),
        {
          name: '1password',
          checked: true
        },
        {
          name: 'adobe-creative-cloud',
          checked: true
        },
        {
          name: 'alfred',
          checked: false
        },
        {
          name: 'dropbox',
          checked: false
        },
        {
          name: 'free-download-manager',
          checked: true
        },
        {
          name: 'microsoft-office',
          checked: true
        },
        {
          name: 'monitorcontrol',
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
          name: 'synologyassistant',
          checked: true
        },
        {
          name: 'synology-drive',
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
        },
        {
          name: 'zeplin',
          checked: true
        },
        new inquirer.Separator(' = Gaming Clients = '),
        {
          name: 'battle-net',
          checked: true
        },
        {
          name: 'epic-games',
          checked: true
        },
        {
          name: 'origin',
          checked: true
        },
        {
          name: 'steam',
          checked: true
        },
        new inquirer.Separator(' = Games = '),
        {
          name: 'minecraft',
          checked: false
        },
        new inquirer.Separator(' = Gaming Related = '),
        {
          name: 'streamlabs-obs',
          checked: true
        },
        new inquirer.Separator(' = VPN = '),
        {
          name: 'tunnelbear',
          checked: false
        },
        {
          name: 'tunnelblick',
          checked: false
        },
        new inquirer.Separator(' = File Manager = '),
        {
          name: 'android-file-transfer',
          checked: false
        },
        {
          name: 'omnidisksweeper',
          checked: false
        },
        new inquirer.Separator(' = Finance = '),
        {
          name: 'gnucash',
          checked: false
        },
      ]
    }
  ]);
}

async function askVSCodePlugins() {
  return inquirer.prompt([
    {
      type: 'checkbox',
      message: 'Select the VSCode plugins to install',
      name: 'plugins',
      pageSize: 50,
      choices: [
        new inquirer.Separator(' = Essentials = '),
        {
          name: 'IntelliJ IDEA Key Bindings (k--kato.intellij-idea-keybindings)',
          value: 'k--kato.intellij-idea-keybindings',
          checked: true
        },
        {
          name: 'Darcula IntelliJ Theme (trinm1709.dracula-theme-from-intellij)',
          value: 'trinm1709.dracula-theme-from-intellij',
          checked: true
        },
        {
          name: 'EditorConfig (EditorConfig.EditorConfig)',
          value: 'EditorConfig.EditorConfig',
          checked: true
        },
        new inquirer.Separator(' = EmberJS = '),
        {
          name: 'Ember Language Server - Autocompletes',
          value: 'emberjs.vscode-ember',
          checked: true
        },
        { // This one requires configs
          name: 'Ember Related Files - Find files easily (cmd + alt + p)',
          value: 'josa.ember-related-files',
          checked: true
        },
        new inquirer.Separator(' = Firebase = '),
        {
          name: 'Firebase - Firestore Security Rules and Indexes (toba.vsfire)',
          value: 'toba.vsfire',
          checked: false
        }
      ]
    }
  ]);
}

async function askVSCodeConfiguration() {
  return inquirer.prompt([
    {
      type: 'confirm',
      message: 'Do you want to configure VSCode settings and keybindings?',
      name: 'confirm',
      default: true
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

  // If installing vscode asks for installing vscode configs
  if (macOSPackages && macOSPackages.packages.includes('visual-studio-code')) {
    const vscodePlugins = await askVSCodePlugins();
    if(vscodePlugins && vscodePlugins.plugins.length > 0) {
      vscodePlugins.plugins.forEach((plugin) => {
        shell.exec(`code --install-extension ${plugin}`);
      });
    }

    const vscodeConfiguration = await askVSCodeConfiguration();
    if(vscodeConfiguration && vscodeConfiguration.confirm) {
      shell.exec(`./scripts/vscode-configuration.sh`);
    }
  }
})();
