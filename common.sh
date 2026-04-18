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

# shellcheck source=modules/git/git.sh
. modules/git/git.sh

# shellcheck source=modules/git/github.sh
. modules/git/github.sh

# shellcheck source=modules/terminal/shell-aliases.sh
. modules/terminal/shell-aliases.sh

# shellcheck source=modules/terminal/starship.sh
. modules/terminal/starship.sh

# Remember that jq.sh requires Homebrew.sh.
# shellcheck source=modules/jq.sh
. modules/jq.sh

# shellcheck source=modules/nodejs.sh
. modules/nodejs.sh

# shellcheck source=modules/ruby.sh
. modules/ruby.sh

# shellcheck source=modules/java.sh
. modules/java.sh

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

# shellcheck source=modules/claude.sh
. modules/claude.sh

if isOsx "$PLATFORM"; then
    logSummary "Remember to download Audacity for audio edition from: https://www.audacityteam.org/download/mac/"
fi
