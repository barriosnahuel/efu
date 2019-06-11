#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v java >/dev/null; then
    preInstallationLog "Java"

    sdk install java

    postInstallationLog "Java"
else
    logAlreadyInstalled "Java"
fi

logProgramVersion "Java" "$(java -version)"