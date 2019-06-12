#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.
# shellcheck disable=SC1090

enterDirOrExit "${CURRENT_DIR}"

if ! command -v sdk >/dev/null; then
    preInstallationLog "sdkman"
    export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash &&

    # This is required in order to apply previous installs for current terminal session.
    source "$SDKMAN_DIR/bin/sdkman-init.sh"

    postInstallationLog "sdkman"
else
    logAlreadyInstalled "sdkman"
fi

logProgramVersion "sdkman" "$(sdk version)"