#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####
# shellcheck disable=SC1091

if isOsx "$PLATFORM"; then
    . modules/homebrew.sh
else
    logInfo "Installing gdebi package manager..."
    sudo apt-get -fy install gdebi

    logInfo "Updating software sources. Required after adding ppa repositories."
    sudo apt-get update

    logInfo "Fixing current packages..."
    sudo apt-get -f install

    logInfo "Removing packages that are not necessary to prevent conflicts..."
    sudo apt-get autoremove

    logSummary "Software repositories and packages updated ok"
fi

if isLubuntu "$PLATFORM"; then
    return 0
fi

addToShell "# Add user custom directory to PATH. Needed at least for diff-so-fancy, and future tools"
addToShell "export PATH=~/Coding/tools:\$PATH"
logSummary "Added ~/Coding/tools to PATH"

# shellcheck source=modules/git.sh
. modules/git.sh

# shellcheck source=modules/ssh/ssh.sh
. modules/ssh/ssh.sh

# Remember that oh-my-zsh.sh requires Homebrew.sh.
# shellcheck source=modules/oh-my-zsh.sh
. modules/oh-my-zsh/oh-my-zsh.sh

# Remember that jq.sh requires Homebrew.sh.
# shellcheck source=modules/jq.sh
. modules/jq.sh

# shellcheck source=modules/nodejs.sh
. modules/nodejs.sh

# shellcheck source=modules/ruby.sh
. modules/ruby.sh

# shellcheck source=modules/android.sh
. modules/android.sh

# shellcheck source=modules/sublime-text.sh
. modules/sublime-text.sh

# shellcheck source=modules/google-drive.sh
. modules/google-drive.sh

# shellcheck source=modules/gimp.sh
. modules/gimp.sh

# shellcheck source=modules/mixxx.sh
. modules/mixxx.sh

# shellcheck source=modules/java.sh
. modules/java.sh

if isOsx "$PLATFORM"; then
    logSummary "Remember to download Audacity for audio edition from: https://www.audacityteam.org/download/mac/"
fi
