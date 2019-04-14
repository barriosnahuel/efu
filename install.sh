#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

. ./functions.sh
log "To see the installation log run the following in a new tab of your command line: tail –f ~/Downloads/efu.log"
log "Functions loaded OK"


log "Checking platform..."
PLATFORM="$1"


if ! isUbuntu "$1" && ! isOsx "$1" && ! isLubuntu "$1"; then
    logError "Must specify a platform: [osx | ubuntu | lubuntu]"
    exit 1
fi


if isOsx "$PLATFORM"; then
    log "Detected platform <OS X>"
    logInfo "Download Transmission torrents client from: https://www.transmissionbt.com/download"
    logInfo "Download Mac Fans Control from: http://www.crystalidea.com/macs-fan-control"
elif isUbuntu "$PLATFORM"; then
    log "Detected platform <Ubuntu>"

    gnome-terminal --working-directory ~/Downloads --tab -- tail -f efu.log &&
    gnome-terminal --working-directory ~/Downloads --tab -- tail -f summary.efu.log

else
    log "Detected platform <Lubuntu>"
fi


logInfo "Download latest JetBrains Intellij IDEA EAP from: https://confluence.jetbrains.com/display/IDEADEV/EAP"
logInfo "Download latest Android Studio from: http://tools.android.com/download/studio/canary/latest"
logInfo "Remember to download the following plugins for both IDEA/Android Studio: .gitignore; MultiMarkDown; IDETalk; WakaTime"
logInfo "Download JDownloader2 from: http://jdownloader.org/download/index"


# Required because we're moving away from current directory when creating directories or uncompressing software =(
CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"


log "Creating coding directories tree"
. ./createDirectoriesTree.sh
log "Coding directories tree created ok"


log "Loading properties file..."
cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)
. ./properties.sh
log "Properties file loaded ok"


log "Loading common software installation"
. ./common.sh
log "Common software installed ok"


log "Loading $PLATFORM custom installation file..."
if isUbuntu "$PLATFORM" ; then
    . ./Ubuntu/core.sh
else
    # This is to show hidden files in Finder (OS X)
    defaults write com.apple.finder AppleShowAllFiles YES
fi


logInfo "#### Installation of your favorite software has finished ####"
logInfo "Thanks for using me! -- Don't forget to fork me on Github: http://github.com/barriosnahuel/efu"
logInfo "To see the installation log run the following on the command line: 'tail –f ~/Downloads/efu.log'"
log "[Important] You should also take a look to: '~/Downloads/summary.efu.log'"
