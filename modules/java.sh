#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.


if ! command -v java >/dev/null; then
    logInfo "Download latest Java7 from: http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html"
    logInfo "Download latest Java8 from: http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html"
    logInfo "Remember to update JAVA_HOME environment variable after installing Java"

    log "Setting up Java environment variables..."
    addToShell "#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"

    # shellcheck disable=SC2016
    addToShell '#export PATH=$JAVA_HOME/bin:$PATH'
else
    logAlreadyInstalled "Java"
fi

logProgramVersion "Java" "$(java version)"