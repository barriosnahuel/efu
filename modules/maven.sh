#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v mvn >/dev/null; then
    preInstallationLog "Apache Maven"

    if isUbuntu "$PLATFORM" ; then

        enterDirOrExit ~/Coding/xDKs/
        downloadAndUncompress "Apache Maven" "http://mirrors.nxnethosting.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip" &&


        addToShell "###"
        addToShell "# Apache Maven env vars"
        addToShell "##"
        addToShell "export M2_HOME=\$HOME/Coding/xDKs/apache-maven-3.3.9"
        addToShell "export PATH=\$M2_HOME/bin:\$PATH"
        addToShell ""

    else
        sdk install maven
    fi

    postInstallationLog "Apache Maven"

else
    logAlreadyInstalled "Apache Maven"
fi

logProgramVersion "Apache Maven" "$(mvn -v)"