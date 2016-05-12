#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

cd "${CURRENT_DIR}"

if ! command -v go >/dev/null; then

    preInstallationLog "Go language"

    if [ "$(isUbuntu "$PLATFORM")" ]; then

        logInfo "Adding repositories for Go language"

        sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
        sudo apt-get update
        sudo apt-get -fy install golang
    else
        brew install go
    fi

    # shellcheck disable=SC2016
    addToShell 'export GOPATH=$HOME/Coding/xDKs/gopath'

    # shellcheck disable=SC2016
    addToShell 'export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH'

    postInstallationLog "Go language"
else
    logAlreadyInstalled "Go Language"
fi

logProgramVersion "Go" "$(go version)"