#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####

if isUbuntu "$PLATFORM"; then
    log "#### Adding particular software repositories ####"

    log "Installing gdebi package manager..."
    sudo apt-get -fy install gdebi

    log "Adding repositories for Sublime Text 3..."
    sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

    log "Adding repositories for Ubuntu Make..."
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y

    log "Adding repositories for Go language"
    sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable

    log "Adding repositories for Drive..."
    sudo add-apt-repository ppa:twodopeshaggy/drive -y

    log "Adding repositories for Mixxx DJ software..."
    sudo add-apt-repository ppa:mixxx/mixxx -y

    log "Adding repositories for Rhythmbox and its plugins..."
    sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
    sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y

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
