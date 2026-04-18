#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

enterDirOrExit "${CURRENT_DIR}"

if isUbuntu "$PLATFORM" ; then
    # This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860
    addToShell "# This is to stop getting warning messages about iBus daemon. Taken from https://youtrack.jetbrains.com/issue/IDEA-78860"
    addToShell "export IBUS_ENABLE_SYNC_MODE=1"
else
    logSummary "Download Android File Transfer from: https://www.android.com/filetransfer"
fi

logInfo "Configuring Android SDK environment variables..."

addToShell ""
addToShell "###"
addToShell "# Android SDK env vars & aliases"
addToShell "##"
addToShell "export ANDROID_HOME=\$HOME/Library/Android/sdk"
addToShell "export PATH=\$ANDROID_HOME/tools:\$PATH"
addToShell "export PATH=\$ANDROID_HOME/platform-tools:\$PATH"

# This is to be able to use the hierarchy viewer
addToShell ""
addToShell "# This is to be able to use the hierarchy viewer"
addToShell "export ANDROID_HVPROTO=ddm"
addToShell ""

logSummary "Successfully added Android environment variables."
logSummary "Remember to manually add \$ANDROID_HOME/build-tools/major.minor.patch after installing Android Studio."


logSummary "Remember you can use Dex2Jar tool: https://github.com/pxb1988/dex2jar"


###
# Android CLI - https://developer.android.com/tools/agents/android-cli/archive
# macOS: https://dl.google.com/android/cli/latest/darwin_arm64/install.sh
# Linux: https://dl.google.com/android/cli/latest/linux_x86_64/install.sh
##
preInstallationLog "Android CLI"

sudo mkdir -p /usr/local/bin

if isUbuntu "$PLATFORM" ; then
    curl -fsSL https://dl.google.com/android/cli/latest/linux_x86_64/install.sh | bash
else
    curl -fsSL https://dl.google.com/android/cli/latest/darwin_arm64/install.sh | bash
fi

postInstallationLog "Android CLI"


###
# https://github.com/google/android-classyshark/
##
preInstallationLog "ClassyShark"

enterDirOrExit ~/Workspace/tools/

mkdir classyshark
enterDirOrExit classyshark
downloadAssetFromGitHub "$(getGitHubFirstAssetFromLatestRelease "google/android-classyshark")"
addToShell "alias classyshark='java -jar ~/Workspace/tools/classyshark/ClassyShark.jar &'"
logSummary "'classyshark' alias created ok"
postInstallationLog "ClassyShark"


###
# https://github.com/JakeWharton/pidcat
##
preInstallationLog "Pidcat Android Logcat decorator"

if isUbuntu "$PLATFORM" ; then
    enterDirOrExit ~/Workspace/tools/
    curl -H "Accept: application/vnd.github.v3.raw" \
         -LO https://api.github.com/repos/JakeWharton/pidcat/contents/pidcat.py
    addToShell "alias pidcat='python ~/Workspace/tools/pidcat.py'"
else
    brew install pidcat
fi

postInstallationLog "Pidcat Android Logcat decorator"
logSummary "Run 'pidcat your.application.package' to see an improved logcat. More info at https://github.com/JakeWharton/pidcat"


addToShell "alias stop='./gradlew --stop'"
addToShell "alias deep='adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d'"
addToShell "alias aaa='adb shell dumpsys activity activities | sed -En -e \"/Stack #/p\" -e \"/Running activities/,/Run #0/p\"'"

enterDirOrExit "${CURRENT_DIR}"