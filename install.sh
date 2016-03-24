#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

. ./functions.sh
log "To see the installation log run the following in a new tab of your command line: tail –f ~/Downloads/efu.log"
log "Functions loaded OK"


log "Checking platform..."
PLATFORM=$1


if [ "$PLATFORM" != "osx" ] && [ "$PLATFORM" != "ubuntu" ]; then
    logError "Must specify a platform: [osx | ubuntu]"
    exit 1
fi


if isOsx "$PLATFORM"; then
    log "Detected platform <OS X>"
else
    log "Detected platform <Ubuntu>"
fi


log "Creating coding directories tree"
. ./createDirectoriesTree.sh
log "Coding directories tree created ok"


log "Loading properties file..."
. ./properties.sh
log "Properties file loaded ok"


log "Loading common software installation"
. ./common.sh
log "Common software installed ok"


log "Loading $PLATFORM custom installation file..."
if [ "$isOsx" ]; then
    . ./OS\ X/installAll-10.11.sh
else
    . ./Ubuntu/installAll-15.04.sh
fi


logInfo "Download latest JetBrains Intellij IDEA EAP from: https://confluence.jetbrains.com/display/IDEADEV/EAP"
logInfo "Download latest Android Studio from: http://tools.android.com/download/studio/canary/latest"
logInfo "Download JDownloader2 from: http://jdownloader.org/download/index"


log "#### Finished installation of favorite software ####"
log "Thanks for using me! --- Don't forget to fork me on Github: http://github.com/barriosnahuel/efu ####"
log "To see the installation log run the following line on the command line: 'tail –f ~/Downloads/efu.log'"
log "[Important] You should also take a look to: '~/Downloads/summary.efu.log'"