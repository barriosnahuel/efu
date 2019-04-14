#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

cd "${CURRENT_DIR}" || echo "Failed cding into EFU's execution directory, exiting..." && exit

if ! command -v nvm >/dev/null; then
    preInstallationLog "NVM"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    postInstallationLog "NVM"
else
    logAlreadyInstalled "NVM"
fi


if ! command -v node >/dev/null; then
    preInstallationLog "NodeJS"

    nvm install 10
else
    logAlreadyInstalled "NodeJS"
fi


if ! command -v npm >/dev/null; then
    preInstallationLog "NPM"
    curl -L https://www.npmjs.com/install.sh | sh
    postInstallationLog "NPM"
else
    logAlreadyInstalled "NPM"
fi


logProgramVersion "NVM" "$(nvm version)"
logProgramVersion "Node" "$(node -v)"
logProgramVersion "NPM" "$(npm -v)"

log "Installing (globally) via the NPM package manager: 'mocha', 'bower' and 'express-generator' modules"
npm install -g mocha bower express-generator

logProgramVersion "Mocha" "$(mocha --version)"
logProgramVersion "Bower" "$(bower --version)"