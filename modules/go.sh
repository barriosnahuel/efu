#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v go >/dev/null; then

    preInstallationLog "Go language"

    if isUbuntu "$PLATFORM" ; then

        log "Adding repositories for Go language"

        sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
        sudo apt-get update
        sudo apt-get -fy install golang
    else
        brew install go
    fi

    addToShell "export GOPATH=\$HOME/Coding/xDKs/gopath"
    addToShell "export PATH=/usr/local/go/bin:\$GOPATH/bin:$PATH"

    postInstallationLog "Go language"
else
    logAlreadyInstalled "Go Language"
fi

logProgramVersion "Go" "$(go version)"