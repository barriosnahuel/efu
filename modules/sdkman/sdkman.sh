#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash

log "Installing Gradle through sdkman"
sdk install gradle

cp modules/sdkman/gradle.properties ~/.gradle/
log "Gradle installed and configured successfully. Check ~/.gradle/gradle.properties to see current configuration"


log "Installing Apache Ant through sdkman"
sdk install ant
logProgramVersion "Apache Ant" "$(ant -v)"

log "Installing Kotlin through sdkman"
sdk install kotlin

log "Installing Groovy through sdkman"
sdk install groovy

log "Installing Grails through sdkman"
sdk install grails