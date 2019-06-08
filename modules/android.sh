#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

enterDirOrExit "${CURRENT_DIR}"

log "Configuring Android development environment..." &&

if isUbuntu "$PLATFORM" ; then

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

addToShell "export ANDROID_HOME=\$HOME/Coding/xDKs/android-sdk"
addToShell "export PATH=\$ANDROID_HOME/tools:\$PATH"
addToShell "export PATH=\$ANDROID_HOME/platform-tools:\$PATH"

# This is to be able to use the hierarchy viewer
addToShell "export ANDROID_HVPROTO=ddm"

log "Successfully added Android environment variables."


preInstallationLog "Android utilities"

logInfo "Remember you can use Dex2Jar tool: https://github.com/pxb1988/dex2jar"

preInstallationLog "ClassyShark"
# https://github.com/google/android-classyshark/

enterDirOrExit ~/Coding/tools/

mkdir classyshark
enterDirOrExit classyshark
downloadAssetFromGitHub "$(getGitHubFirstAssetFromLatestRelease "google/android-classyshark")"
addToShell "alias classyshark='java -jar ~/Coding/tools/classyshark/ClassyShark.jar &'"
logInfo "[Android Utilities]: 'classyshark' alias created."
postInstallationLog "ClassyShark"


preInstallationLog "Pidcat Android Logcat decorator"
# https://github.com/JakeWharton/pidcat

if isUbuntu "$PLATFORM" ; then
    enterDirOrExit ~/Coding/tools/
    curl -H "Accept: application/vnd.github.v3.raw" \
         -LO https://api.github.com/repos/JakeWharton/pidcat/contents/pidcat.py
    addToShell "alias pidcat='python ~/Coding/tools/pidcat.py'"
else
    brew install pidcat
fi

logInfo "[Android Utilities]: run 'pidcat your.application.package' to see an improved logcat. More info at https://github.com/JakeWharton/pidcat"
postInstallationLog "Pidcat Android Logcat decorator"

postInstallationLog "Android utilities"