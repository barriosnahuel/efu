#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)

preInstallationLog "jq json beautifer"

if isUbuntu "$PLATFORM" ; then
    sudo apt-get -fy install jq
else
    brew install jq
fi

postInstallationLog "jq json beautifer"