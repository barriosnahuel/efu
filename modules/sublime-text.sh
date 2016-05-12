#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}"

if [ "$(isUbuntu "$PLATFORM")" ]; then
    logInfo "Adding repositories for Sublime Text 3..."
    sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
    sudo apt-get update

    log "Instaling Sublime Text 3"
    sudo apt-get -fy install sublime-text-installer
else
    logInfo "Download Sublime Text from: https://www.sublimetext.com/3"
fi