#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)

if ! command -v drive >/dev/null; then

    preInstallationLog "Google Drive client"

    if isUbuntu "$PLATFORM" ; then
        log "Adding repositories for Google Drive client..."

        sudo add-apt-repository ppa:twodopeshaggy/drive
        sudo apt-get update
        sudo apt-get -fy install drive
    else
        go get -u github.com/odeke-em/drive/cmd/drive
    fi

    postInstallationLog "Google Drive client"
else
    logAlreadyInstalled "Google Drive Client"
fi

logInfo "See https://github.com/odeke-em/drive#usage to mount your Google Drive directory on your local filesystem"
logProgramVersion "Google Drive client" "$(drive version)"