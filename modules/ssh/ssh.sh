#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

logWarn "Generating a new SSH Key for $USER_EMAIL" &&

# Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C "$USER_EMAIL" &&

# Start the ssh-agent in the background
eval "$(ssh-agent-s)" &&

# Finally add the new key.
if isOsx "$PLATFORM" ; then

    cp config ~/.ssh/ &&
    ssh-add -K ~/.ssh/id_rsa

    # shellcheck disable=SC2002
    cat ~/.ssh/id_rsa.pub | pbcopy
    logSummary "SSH Key copied to clipboard. If not, just run: 'cat ~/.ssh/id_rsa.pub | pbcopy'"

else

    ssh-add ~/.ssh/id_rsa &&

    if ! command -v xclip >/dev/null; then
        preInstallationLog "xclip"
        sudo apt-get -fy install xclip
        postInstallationLog "xclip"
    else
        logAlreadyInstalled "xclip"
    fi

    xclip -sel clip < ~/.ssh/id_rsa.pub
    logSummary "SSH Key copied to clipboard. If don't, just run: 'xclip -sel clip < ~/.ssh/id_rsa.pub'"
fi
logSummary "SSH key added for $USER_EMAIL"