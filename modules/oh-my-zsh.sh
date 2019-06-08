#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v zsh >/dev/null; then
    preInstallationLog "ZSH"

    if isUbuntu "$PLATFORM" ; then
        sudo apt-get -fy install zsh
    else
        brew install zsh
    fi

    postInstallationLog "ZSH"
else
    chsh -s "$(which zsh)"
    logAlreadyInstalled "ZSH"
fi

logProgramVersion "ZSH" "$(zsh --version)"

# shellcheck disable=SC2016
log 'Default shell changed to "zsh", to revert change just run: "chsh -s $(which bash)"'


preInstallationLog "Oh-My-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
postInstallationLog "Oh-My-ZSH"


sed -i -e 's/plugins=(git)/plugins=(git git-extras common-aliases dirhistory)/' ~/.zshrc &&
logInfo "Added some plugins to Oh-My-ZSH: git, git-extras, common-aliases, dirhistory."

sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="avit"/' ~/.zshrc &&
logInfo 'ZSH Theme changed to "avit", to view more themes go to: https://github.com/robbyrussell/oh-my-zsh/wiki/themes'