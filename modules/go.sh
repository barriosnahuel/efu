#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.



if ! command -v go >/dev/null; then

    preInstallationLog "Go language"

    if isUbuntu "$PLATFORM"; then
        sudo apt-get -fy install golang
    else
        brew install go
    fi

    postInstallationLog "Go language"
else
    log "Go already installed"
fi

logProgramVersion "Go" "$(go version)"