#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then
    preInstallationLog "Sublime Text 3"

    logInfo "Adding repositories for Sublime Text 3..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update

    logInfo "Installing Sublime Text 3"
    sudo apt-get -fy install sublime-text

    postInstallationLog "Sublime Text 3"
else
    logSummary "Download Sublime Text from: https://www.sublimetext.com/3"
fi