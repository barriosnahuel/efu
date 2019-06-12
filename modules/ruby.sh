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


if ! command -v ruby >/dev/null; then
    preInstallationLog "Ruby"

    rvm install ruby

    postInstallationLog "Ruby"
else
    logAlreadyInstalled "Ruby"
fi


logProgramVersion "RVM" "$(rvm version)"
logProgramVersion "Ruby" "$(ruby -version)"