#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v git >/dev/null; then

    if isUbuntu "$PLATFORM" ; then
        preInstallationLog "GIT"
        sudo apt-get -fy install git
        postInstallationLog "GIT"
    else
        preInstallationLog "Mac OS X Command line tools"
        xcode-select --install
        postInstallationLog "Mac OS X Command line tools"
    fi
else
    logAlreadyInstalled "GIT"
fi

git config --global user.name "$USER_FULL_NAME" &&
git config --global user.email "$USER_EMAIL"    &&
git config --global push.default matching       &&
git config --global core.autocrlf               &&

###
# GIT utility to see git diff the right way. https://github.com/so-fancy/diff-so-fancy
##
preInstallationLog "GIT diff-so-fancy utility"
enterDirOrExit ~/Coding/tools
curl -O https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy &&
chmod +x diff-so-fancy &&
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" &&

git config --global color.ui true &&

git config --global color.diff-highlight.oldNormal    "red bold"      &&
git config --global color.diff-highlight.oldHighlight "red bold 52"   &&
git config --global color.diff-highlight.newNormal    "green bold"    &&
git config --global color.diff-highlight.newHighlight "green bold 22" &&

git config --global color.diff.meta       "yellow"        &&
git config --global color.diff.frag       "magenta bold"  &&
git config --global color.diff.commit     "yellow bold"   &&
git config --global color.diff.old        "red bold"      &&
git config --global color.diff.new        "green bold"    &&
git config --global color.diff.whitespace "red reverse"   &&

postInstallationLog "GIT diff-so-fancy utility"


preInstallationLog "GIT cloner (https://gist.github.com/barriosnahuel/93e6a955cf64478ac886dc0d06aeb37a)" &&
enterDirOrExit ~/Coding/tools &&
curl -o cloner.sh https://gist.githubusercontent.com/barriosnahuel/93e6a955cf64478ac886dc0d06aeb37a/raw &&

addToShell ""
addToShell "alias clone='sh ~/Coding/tools/cloner.sh'"
addToShell "alias remote='git rev-parse --abbrev-ref --symbolic-full-name @{u}'"

postInstallationLog "GIT cloner (https://gist.github.com/barriosnahuel/93e6a955cf64478ac886dc0d06aeb37a)"


logSummary "GIT configured successfully."

logProgramVersion "GIT" "$(git version)"

enterDirOrExit "${CURRENT_DIR}"