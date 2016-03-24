#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####

if isUbuntu "$PLATFORM"; then
    log "#### Adding particular software repositories ####"

    log "Installing gdebi package manager..."
    sudo apt-get -fy install gdebi

    log "Updating software sources. Required after adding ppa repositories."
    sudo apt-get update

    log "Fixing current packages..."
    sudo apt-get -f install

    log "Removing packages that are not necessary to prevent conflicts..."
    sudo apt-get autoremove

    log "#### Software repositories and packages updated ok ####"
else
    . modules/homebrew.sh
fi

. modules/oh-my-zsh.sh
. modules/git.sh
. modules/nodejs.sh
. modules/sdkman/sdkman.sh
. modules/android.sh
. modules/go.sh
. modules/google-drive.sh
