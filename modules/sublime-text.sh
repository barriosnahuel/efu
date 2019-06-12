#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then
    preInstallationLog "Sublime Text 3"

    logInfo "Adding repositories for Sublime Text 3..."
    sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
    sudo apt-get update

    logInfo "Instaling Sublime Text 3"
    sudo apt-get -fy install sublime-text-installer

    postInstallationLog "Sublime Text 3"
else
    logSummary "Download Sublime Text from: https://www.sublimetext.com/3"
fi