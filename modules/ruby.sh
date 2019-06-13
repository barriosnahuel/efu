#!/bin/bash
# Created by Nahuel Barrios on 15/09/17.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v rvm >/dev/null; then
    preInstallationLog "RVM"

    curl -sSL https://get.rvm.io | bash -s stable

    # This is required to be able to use the rvm command in the same Terminal.
    source ~/.rvm/scripts/rvm

    postInstallationLog "RVM"
else
    logAlreadyInstalled "RVM"
fi

logProgramVersion "RVM" "$(rvm version)"


# Always install latest ruby available even if it's already installed.
rvm install ruby

logProgramVersion "Ruby" "$(ruby -version)"