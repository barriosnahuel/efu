#!/bin/bash
# Created by Nahuel Barrios on 18/3/16.

preInstallationLog "Homebrew"
if ! command -v brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # shellcheck disable=SC2016
    addToShell 'export PATH="/usr/local/bin:$PATH"'
else
  log "Homebrew already installed. Skipping..."
fi

log "Updating Homebrew formulas..."
brew update

log "Verifying the Homebrew installation..."
if brew doctor; then
  postInstallationLog "Homebrew"
else
  log "Your Homebrew installation reported some errors or warnings."
  logError "Review the Homebrew messages to see if any action is needed."
fi

logProgramVersion "Homebrew" "$(brew --version)"


preInstallationLog "Transmission"
brew install transmission
postInstallationLog "Transmission"


preInstallationLog "Apache Maven"
brew install maven
postInstallationLog "Apache Maven"


preInstallationLog "Heroku" &&
brew install heroku-toolbelt &&
postInstallationLog "Heroku" &&
heroku login &&
log "Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add &&
log "Heroku configured successfully"