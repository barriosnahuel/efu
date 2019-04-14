#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)

if ! command -v sdk >/dev/null; then
    preInstallationLog "sdkman"
    export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash &&

    # shellcheck source=/dev/null
    source "$HOME/Coding/xDKs/sdkman/bin/sdkman-init.sh"
    postInstallationLog "sdkman"
else
    logAlreadyInstalled "sdkman"
fi

logProgramVersion "sdkman" "$(sdk version)"

cp modules/sdkman/gradle.properties ~/.gradle/ &&
log "Gradle properties created successfully. Check ~/.gradle/gradle.properties to see current configuration"

# This is required in order to apply previous installs for current terminal session.
# shellcheck source=/dev/null
source "$HOME/Coding/xDKs/sdkman/bin/sdkman-init.sh"