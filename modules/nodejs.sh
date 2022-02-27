#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.
# shellcheck disable=SC1090

enterDirOrExit "${CURRENT_DIR}"

if ! command -v nvm >/dev/null; then
    preInstallationLog "NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

    # Required to be able to call > nvm XXX on current terminal session.
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    postInstallationLog "NVM"
else
    logAlreadyInstalled "NVM"
fi


if ! command -v node >/dev/null; then
    preInstallationLog "NodeJS"

    nvm install 17
else
    logAlreadyInstalled "NodeJS"
fi


if ! command -v npm >/dev/null; then
    preInstallationLog "NPM"
    nvm install-latest-npm
    postInstallationLog "NPM"
else
    logAlreadyInstalled "NPM"
fi


logProgramVersion "NVM" "$(nvm --version)"
logProgramVersion "Node" "$(node -v)"
logProgramVersion "NPM" "$(npm -v)"

logInfo "Installing (globally) via the NPM package manager: 'mocha', 'bower' and 'express-generator' modules"
npm install -g mocha bower express-generator

logProgramVersion "Mocha" "$(mocha --version)"
logProgramVersion "Bower" "$(bower --version)"