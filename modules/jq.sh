#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "jq json beautifer"

if isUbuntu "$PLATFORM" ; then
    sudo apt-get -fy install jq
else
    brew install jq
fi

postInstallationLog "jq json beautifer"