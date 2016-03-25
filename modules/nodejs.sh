#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

preInstallationLog "NodeJS (with NPM)"
if [ "$(isUbuntu "$PLATFORM")" ]; then

    cd ~/Coding/xDKs/
    downloadAndUncompress "NodeJS" "$NODE_JS"
    cd ~/Downloads/

    # shellcheck disable=SC2016
    addToShell 'export PATH=$HOME/Coding/xDKs/node-v4.4.1-linux-x64/bin:$PATH'

    log "NodeJS and NPM installed and configured successfully."
else
    brew install node

    if ! command -v npm >/dev/null; then
        curl -L https://www.npmjs.com/install.sh | sh
    else
      log "NPM installed ok."
    fi
fi

# shellcheck disable=SC2016
addToShell 'export PATH="$HOME/.node/bin:$PATH"'

log "Added ~/.node/bin to your PATH so commands you install globally are usable."

logProgramVersion "Node" "$(node -v)"
logProgramVersion "NPM" "$(npm -v)"

log "Installing (globally) via the NPM package manager: 'mocha', 'bower' and 'express-generator' modules"
npm install -g mocha bower express-generator

logProgramVersion "Mocha" "$(mocha --version)"
logProgramVersion "Bower" "$(bower --version)"