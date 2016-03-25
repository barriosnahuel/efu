#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.


if ! command -v sdk >/dev/null; then
    preInstallationLog "sdkman"
    export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash &&
    source "$HOME/Coding/xDKs/sdkman/bin/sdkman-init.sh"
    postInstallationLog "sdkman"
else
    logAlreadyInstalled "sdkman"
fi

logProgramVersion "sdkman" "$(sdk version)"

log "Installing Gradle through sdkman"
sdk install gradle &&

cp modules/sdkman/gradle.properties ~/.gradle/ &&
log "Gradle installed and configured successfully. Check ~/.gradle/gradle.properties to see current configuration"
logProgramVersion "Gradle" "$(gradle -v)"


log "Installing Apache Ant through sdkman"
sdk install ant
logProgramVersion "Apache Ant" "$(ant -v)"


log "Installing Kotlin through sdkman"
sdk install kotlin
logProgramVersion "Kotlin" "$(kotlin -version)"


log "Installing Groovy through sdkman"
sdk install groovy
logProgramVersion "Groovy" "$(groovy -v)"


log "Installing Grails through sdkman"
sdk install grails
logProgramVersion "Grails" "$(grails -v)"