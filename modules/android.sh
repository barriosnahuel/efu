#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####
log "Installing and configuring the Android development environment..." &&

ANDROID_HOME='export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk'
TOOLS_PATH='export PATH=$ANDROID_HOME/tools:$PATH'
PLATFORM_TOOLS_PATH='export PATH=$ANDROID_HOME/platform-tools:$PATH'

# This is to be able to use the hierarchy viewer
HIERARCHY_VIEWER='export ANDROID_HVPROTO=ddm'


if isOsx $PLATFORM; then
    log "Configuring Android SDK environment variables..." &&
    echo "$(ANDROID_HOME)" >> ~/.bash_profile &&
    echo "$(TOOLS_PATH)" >> ~/.bash_profile &&
    echo "$(PLATFORM_TOOLS_PATH)" >> ~/.bash_profile &&
    echo "$(HIERARCHY_VIEWER)" >> ~/.bash_profile &&

    log "Successfully added Android environment variables."
else
    sudo apt-get -fy install ubuntu-make &&
    umake android &&
    log "Android SDK installed successfully"

    log "Configuring Android SDK environment variables..." &&
    echo "$(ANDROID_HOME)" >> ~/.bashrc &&
    echo "$(TOOLS_PATH)" >> ~/.bashrc &&
    echo "$(PLATFORM_TOOLS_PATH)" >> ~/.bashrc &&
    echo "$(HIERARCHY_VIEWER)" >> ~/.bashrc &&

    # This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860
    echo "export IBUS_ENABLE_SYNC_MODE=1" >> ~/.profile &&

    log "Successfully added Android environment variables."
fi