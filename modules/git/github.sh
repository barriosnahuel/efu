#!/bin/bash
# Created by Nahuel Barrios.
# Sets up SSH and GPG credentials for GitHub.

enterDirOrExit "${CURRENT_DIR}"

##
# SSH Key
##
logWarn "Generating a new SSH Key for $USER_EMAIL"

ssh-keygen -t rsa -C "$USER_EMAIL" &&
eval "$(ssh-agent -s)" &&

if isOsx "$PLATFORM"; then
    cp modules/ssh/config ~/.ssh/ &&
    ssh-add --apple-use-keychain ~/.ssh/id_rsa

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
    logSummary "SSH Key copied to clipboard. If not, just run: 'xclip -sel clip < ~/.ssh/id_rsa.pub'"
fi

logSummary "SSH key added for $USER_EMAIL. Add it at: https://github.com/settings/keys"

##
# GPG Key (commit signing)
##
if ! command -v gpg >/dev/null; then
    preInstallationLog "GnuPG"
    if isOsx "$PLATFORM"; then
        brew install gnupg pinentry-mac
    else
        sudo apt-get -fy install gnupg
    fi
    postInstallationLog "GnuPG"
else
    logAlreadyInstalled "GnuPG"
fi

if isOsx "$PLATFORM"; then
    mkdir -p ~/.gnupg
    chmod 700 ~/.gnupg
    PINENTRY_PATH="$(command -v pinentry-mac)"
    echo "pinentry-program ${PINENTRY_PATH}" > ~/.gnupg/gpg-agent.conf
    echo "use-agent" > ~/.gnupg/gpg.conf
fi

preInstallationLog "GPG key for $USER_EMAIL"
gpg --full-generate-key
postInstallationLog "GPG key"

GPG_KEY_ID=$(gpg --list-secret-keys --keyid-format LONG "$USER_EMAIL" | grep sec | head -n 1 | awk '{print $2}' | cut -d'/' -f2)

if [ -n "$GPG_KEY_ID" ]; then
    git config --global user.signingkey "$GPG_KEY_ID" &&
    git config --global commit.gpgsign true
    logSummary "Git configured to sign commits with GPG key: $GPG_KEY_ID"

    if isOsx "$PLATFORM"; then
        gpg --armor --export "$GPG_KEY_ID" | pbcopy
        logSummary "GPG public key copied to clipboard. Add it at: https://github.com/settings/keys"
    fi
else
    logWarn "Could not extract GPG key ID for $USER_EMAIL. Configure git signing manually."
fi

logProgramVersion "GnuPG" "$(gpg --version | head -n 1)"
