#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.


if ! command -v drive >/dev/null; then

    preInstallationLog "Google Drive client"

    if isUbuntu "$PLATFORM"; then
        logInfo "Adding repositories for Google Drive client..."

        sudo add-apt-repository ppa:twodopeshaggy/drive
        sudo apt-get update
        sudo apt-get -fy install drive
    else
        go get -u github.com/odeke-em/drive/cmd/drive
    fi

    postInstallationLog "Google Drive client"
else
    log "Google Drive client already installed"
fi

logProgramVersion "Google Drive client" "$(drive version)"