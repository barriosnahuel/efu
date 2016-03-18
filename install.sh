#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####

. ./functions.sh
log "To see the installation log run the following in a new tab of your command line: tail –f ~/Downloads/efu.log"
log "Functions loaded OK"


log "Creating coding directories tree"
#. ./createDirectoriesTree.sh
log "Coding directories tree created ok"


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


log "Loading properties file..."
if isOsx "$PLATFORM"; then
    . ./OS\ X/properties.sh
else
    . ./Ubuntu/properties.sh
fi
log "Properties file loaded ok"


log "Loading common software installation"
. common.sh
log "Common software installed ok"


#log "Loading $PLATFORM custom installation file..."
#if [ "$isOsx" ]; then
#    . ./OS\ X/installAll-10.9.sh
#else
#    . ./Ubuntu/installAll-15-04.sh
#fi