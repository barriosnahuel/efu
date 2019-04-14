#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)

if ! command -v mvn >/dev/null; then
    preInstallationLog "Apache Maven"

    if isUbuntu "$PLATFORM" ; then

        cd ~/Coding/xDKs/ || (echo "Failed cding into xDKs directory, exiting..." && exit)
        downloadAndUncompress "Apache Maven" "http://mirrors.nxnethosting.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip" &&

        # shellcheck disable=SC 2016
        addToShell 'export M2_HOME=$HOME/Coding/xDKs/apache-maven-3.3.9'

        # shellcheck disable=SC2016
        addToShell 'export PATH=$M2_HOME/bin:$PATH'

    else
        sdk install maven
    fi

    postInstallationLog "Apache Maven"

else
    logAlreadyInstalled "Apache Maven"
fi

logProgramVersion "Apache Maven" "$(mvn -v)"