#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.
# shellcheck disable=SC1091

###
# Clear previous log files
##
if [ -f ~/Downloads/efu.log ]; then
    rm ~/Downloads/efu.log
fi

if [ -f ~/Downloads/summary.efu.log ]; then
    rm ~/Downloads/summary.efu.log
fi


. ./functions.sh
logSummary "Running EFU script at: $(date +%Y-%m-%d_%H-%M-%S)"
logSummary "To see the installation log run the following in a new tab of your command line: tail ~/Downloads/efu.log -f"
logInfo "Functions loaded OK"


logInfo "Checking platform..."
PLATFORM="$1"


if ! isUbuntu "$1" && ! isOsx "$1" && ! isLubuntu "$1"; then
    logError "Must specify a platform: [osx | ubuntu | lubuntu]"
    exit 1
fi


if isOsx "$PLATFORM"; then
    logSummary "Detected platform <OS X>"
    logSummary "Download Transmission torrents client from: https://www.transmissionbt.com/download"
elif isUbuntu "$PLATFORM"; then
    logSummary "Detected platform <Ubuntu>"

    gnome-terminal --working-directory ~/Downloads --tab -- tail -f efu.log &&
    gnome-terminal --working-directory ~/Downloads --tab -- tail -f summary.efu.log

else
    logSummary "Detected platform <Lubuntu>"
fi

logSummary "Remember to download the JetBrains toolbox to use either Intellij IDEA, Android Studio or any other IDE. https://www.jetbrains.com/toolbox/app/"
logSummary "Remember to download the following plugins for both IDEA/Android Studio: .gitignore; MultiMarkDown; IDETalk; WakaTime"
logSummary "Download JDownloader2 from: http://jdownloader.org/download/index"


# Required because we're moving away from current directory when creating directories or uncompressing software =(
CURRENT_DIR="$( cd "$( dirname "$0" )" && pwd )"


logInfo "Creating coding directories tree"
. ./createDirectoriesTree.sh
logSummary "Coding directories tree created ok"

if isOsx "$PLATFORM" ; then
    logInfo "Setting up Finder app to show hidden files by default"
    # This is to show hidden files in Finder (OS X)
    defaults write com.apple.finder AppleShowAllFiles YES &&
    killall Finder &&
    logSummary "Finder is showing hidden files now."
fi

logInfo "Loading properties file..."
enterDirOrExit "${CURRENT_DIR}"
. ./properties.sh
logInfo "Properties file loaded ok"


if isUbuntu "$PLATFORM" ; then
    logInfo "Loading $PLATFORM custom installation file..."
    . ./Ubuntu/core.sh
fi


logInfo "Loading common software installation"
. ./common.sh
logInfo "Common software installed ok"


logInfo "#### Installation of your favorite software has finished ####"
logInfo "Thanks for using me! -- Don't forget to fork me on Github: http://github.com/barriosnahuel/efu"
logInfo "To see the installation log run the following on the command line: 'tail –f ~/Downloads/efu.log'"
logInfo "[Important] You should also take a look to: '~/Downloads/summary.efu.log'"