#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

cd "${CURRENT_DIR}"

if ! command -v sdk >/dev/null; then
    preInstallationLog "sdkman"
    export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash &&
    source "$HOME/Coding/xDKs/sdkman/bin/sdkman-init.sh"
    postInstallationLog "sdkman"
else
    logAlreadyInstalled "sdkman"
fi

logProgramVersion "sdkman" "$(sdk version)"

cp modules/sdkman/gradle.properties ~/.gradle/ &&
log "Gradle properties created successfully. Check ~/.gradle/gradle.properties to see current configuration"


log "Installing Apache Ant through sdkman"
sdk install ant


log "Installing Kotlin through sdkman"
sdk install kotlin


log "Installing Groovy through sdkman"
sdk install groovy


log "Installing Grails through sdkman"
sdk install grails


# This is required in order to apply previous installs for current terminal session.
source "$HOME/Coding/xDKs/sdkman/bin/sdkman-init.sh"

logProgramVersion "Gradle" "$(gradle -v)"
logProgramVersion "Apache Ant" "$(ant -v)"
logProgramVersion "Kotlin" "$(kotlin -version)"
logProgramVersion "Groovy" "$(groovy -v)"
logProgramVersion "Grails" "$(grails -v)"