#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then

    preInstallationLog "Mixxx DJ Software"

    log "Adding repositories for Mixxx DJ software..."
    sudo add-apt-repository ppa:mixxx/mixxx -y
    sudo apt-get update
    sudo apt-get -fy install mixxx libportaudio2

    postInstallationLog "Mixxx DJ Software"
else
    logInfo "Download Mixxx from: http://www.mixxx.org/download/"
fi