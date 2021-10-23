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
    chsh -s "$(command -v zsh)"
    logAlreadyInstalled "ZSH"
fi

logProgramVersion "ZSH" "$(zsh --version)"

# shellcheck disable=SC2016
logSummary "Default shell changed to 'zsh', to revert change just run: 'chsh -s \$(which bash)'"


preInstallationLog "Oh-My-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
postInstallationLog "Oh-My-ZSH"

addToShell ""
addToShell "# DEFAULT_USER env var is used to prevent showing the user@machine in some ZSH themes. i.e.: agnoster"
addToShell "export DEFAULT_USER=$USER"

logInfo "Adding custom GIT info to the terminal"
cp modules/oh-my-zsh/custom-git.zsh ~/.oh-my-zsh/custom/ &&
logSummary "Custom GIT info to the terminal added ok"

sed -i -e 's/plugins=(git)/plugins=(git git-extras common-aliases dirhistory)/' ~/.zshrc &&
logSummary "Added some plugins to Oh-My-ZSH: git, git-extras, common-aliases, dirhistory."


preInstallationLog "nahu.zsh-theme (https://gist.github.com/barriosnahuel/ebabe673ec474f277aa6f2371eeaf372)" &&
enterDirOrExit ~/.oh-my-zsh/themes &&
curl -o nahu.zsh-theme https://gist.githubusercontent.com/barriosnahuel/ebabe673ec474f277aa6f2371eeaf372/raw &&
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="nahu"/' ~/.zshrc &&
postInstallationLog "nahu.zsh-theme (https://gist.github.com/barriosnahuel/ebabe673ec474f277aa6f2371eeaf372)"

logSummary 'Remember to download Ubuntu Mono font family from: https://fonts.google.com/specimen/Ubuntu+Mono?query=ubuntu (17pt font size for iTerm, 210x60)'

logSummary 'ZSH Theme changed to a custom "nahu" theme, to view more themes go to: https://github.com/robbyrussell/oh-my-zsh/wiki/themes'

enterDirOrExit "${CURRENT_DIR}"