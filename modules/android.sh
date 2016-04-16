#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

log "Configuring Android development environment..." &&

if [ "$(isUbuntu "$PLATFORM")" ]; then

    logInfo "Adding repositories for Ubuntu Make..."
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
    sudo apt-get update

    sudo apt-get -fy install ubuntu-make &&
    umake android &&
    log "Android SDK installed successfully"

    # This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860
    addToShell "# This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860"
    addToShell "export IBUS_ENABLE_SYNC_MODE=1"
else
    logInfo "Download Android File Transfer from: https://www.android.com/filetransfer"
fi

log "Configuring Android SDK environment variables..."

# shellcheck disable=SC2016
addToShell 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk'

# shellcheck disable=SC2016
addToShell 'export PATH=$ANDROID_HOME/tools:$PATH'

# shellcheck disable=SC2016
addToShell 'export PATH=$ANDROID_HOME/platform-tools:$PATH'

# This is to be able to use the hierarchy viewer
addToShell "export ANDROID_HVPROTO=ddm"

log "Successfully added Android environment variables."


preInstallationLog "Android utilities"

preInstallationLog "ClassyShark"
# https://github.com/google/android-classyshark/

cd ~/Coding/tools/
mkdir classyshark
cd classyshark
downloadAssetFromGitHub "$(getGitHubFirstAssetFromLatestRelease "google/android-classyshark")"
addToShell "alias classyshark='java -jar ~/Coding/tools/classyshark/ClassyShark.jar &'"
logInfo "[Android Utilities]: 'classyshark' alias created."
postInstallationLog "ClassyShark"


if [ "$(isOsx "$PLATFORM")" ]; then
    preInstallationLog "Pidcat Android Logcat decorator"
    # https://github.com/JakeWharton/pidcat

    brew install pidcat
    logInfo "[Android Utilities]: run 'pidcat your.application.package' to see an improved logcat. More info at https://github.com/JakeWharton/pidcat"
    postInstallationLog "Pidcat Android Logcat decorator"
fi

postInstallationLog "Android utilities"