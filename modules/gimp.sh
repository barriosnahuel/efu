#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then

    preInstallationLog "Gimp (with some plugins)"
    sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras
    postInstallationLog "Gimp (with some plugins)"

else
    logSummary "Download Gimp from: https://www.gimp.org/downloads/"
fi