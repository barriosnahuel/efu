#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "jq JSON beautifer"

if isUbuntu "$PLATFORM" ; then
    sudo apt-get -fy install jq
else
    brew install jq
fi

postInstallationLog "jq JSON beautifer"