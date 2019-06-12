#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then
    if ! command -v drive >/dev/null; then

        preInstallationLog "Google Drive client"
        logInfo "Adding repositories for Google Drive client..."

        sudo add-apt-repository ppa:twodopeshaggy/drive
        sudo apt-get update
        sudo apt-get -fy install drive

        postInstallationLog "Google Drive client"
    else
        logAlreadyInstalled "Google Drive Client"
    fi

    logProgramVersion "Google Drive client" "$(drive version)"
else
  logInfo "Remember to download the Google Drive client from: https://www.google.com/drive/download/"
fi