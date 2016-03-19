#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

log "Configuring Android development environment..." &&

if isUbuntu "$PLATFORM"; then
    sudo apt-get -fy install ubuntu-make &&
    umake android &&
    log "Android SDK installed successfully"

    # This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860
    addToShell "# This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860"
    addToShell "export IBUS_ENABLE_SYNC_MODE=1"
fi

log "Configuring Android SDK environment variables..." &&

# shellcheck disable=SC2016
addToShell 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk' &&

# shellcheck disable=SC2016
addToShell 'export PATH=$ANDROID_HOME/tools:$PATH' &&

# shellcheck disable=SC2016
addToShell 'export PATH=$ANDROID_HOME/platform-tools:$PATH' &&

# This is to be able to use the hierarchy viewer
addToShell 'export ANDROID_HVPROTO=ddm' &&

log "Successfully added Android environment variables."