#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

logInfo "Generating a new SSH Key for $USER_EMAIL" &&

# Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C "$USER_EMAIL" &&

# Start the ssh-agent in the background
eval "$(ssh-agent-s)" &&

# Finally add the new key.
ssh-add ~/.ssh/id_rsa &&


if [ "$(isUbuntu "$PLATFORM")" ]; then

    if ! command -v brew >/dev/null; then
        preInstallationLog "xclip"
        sudo apt-get -fy install xclip
        postInstallationLog "xclip"
    else
        logAlreadyInstalled "xclip"
    fi

    xclip -sel clip < ~/.ssh/id_rsa.pub
    logInfo "SSH Key copied to clipboard. If don't, just run: 'xclip -sel clip < ~/.ssh/id_rsa.pub'"
else
    cat ~/.ssh/id_rsa.pub | pbcopy
    logInfo "SSH Key copied to clipboard. If not, just run: 'cat ~/.ssh/id_rsa.pub | pbcopy'"
fi