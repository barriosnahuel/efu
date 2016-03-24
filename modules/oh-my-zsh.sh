#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

preInstallationLog "ZSH"
if isUbuntu "$PLATFORM"; then
    sudo apt-get -fy install zsh
else
    brew install zsh
fi

chsh -s $(which zsh) &&
postInstallationLog "ZSH"
log 'Default shell changed to "zsh", to revert change just run: "chsh -s $(which bash)"'


preInstallationLog "Oh-My-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
postInstallationLog "Oh-My-ZSH"


sed -i -e 's/plugins=(git)/plugins=(git git-extras command-not-found common-aliases dirhistory)/' ~/.zshrc &&
log "Added some plugins to Oh-My-ZSH: git, git-extras, command-not-found, common-aliases, dirhistory."