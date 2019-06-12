#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v heroku >/dev/null; then
    preInstallationLog "Heroku toolbelt"

    if isUbuntu "$PLATFORM" ; then
        wget -qO- "https://toolbelt.heroku.com/install-ubuntu.sh" | sh
    else
        brew install heroku-toolbelt
    fi
    postInstallationLog "Heroku toolbelt"

    logInfo "Please login to Heroku with your account."
    heroku login &&
    logInfo "Adding existent public keys to Heroku to be able to run commands..." &&
    heroku keys:add

    logInfo "Heroku account configured successfully."
else
    logAlreadyInstalled "Heroku toolbelt"
fi

logProgramVersion "Heroku toolbelt" "$(heroku version)"

