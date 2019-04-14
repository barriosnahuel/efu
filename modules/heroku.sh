#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}" || echo "Failed cding into EFU's execution directory, exiting..." && exit

if ! command -v heroku >/dev/null; then
    preInstallationLog "Heroku toolbelt"

    if isUbuntu "$PLATFORM" ; then
        wget -qO- "https://toolbelt.heroku.com/install-ubuntu.sh" | sh
    else
        brew install heroku-toolbelt
    fi
    postInstallationLog "Heroku toolbelt"

    log "Please login to Heroku with your account."
    heroku login &&
    log "Adding existent public keys to Heroku to be able to run commands..." &&
    heroku keys:add

    log "Heroku account configured successfully."
else
    logAlreadyInstalled "Heroku toolbelt"
fi

logProgramVersion "Heroku toolbelt" "$(heroku version)"

