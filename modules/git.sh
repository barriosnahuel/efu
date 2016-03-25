#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.


if ! command -v git >/dev/null; then

    if [ "$(isUbuntu "$PLATFORM")" ]; then
        preInstallationLog "GIT"
        sudo apt-get -fy install git
        postInstallationLog "GIT"
    else
        preInstallationLog "Mac OS X Command line tools"
        xcode-select --install
        postInstallationLog "Mac OS X Command line tools"
    fi

    git config --global user.name "$USER_FULL_NAME" &&
    git config --global user.email "$USER_EMAIL" &&
    git config --global push.default simple &&
    log "GIT configured successfully."
else
    logAlreadyInstalled "git"
fi

logProgramVersion "GIT" "$(git version)"