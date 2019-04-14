#!/bin/bash
# Created by Nahuel Barrios on 18/3/16.
# shellcheck disable=SC1091

cd "${CURRENT_DIR}" || (echo "Failed cding into EFU's execution directory, exiting..." && exit)

preInstallationLog "Homebrew"
if ! command -v brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # shellcheck disable=SC2016
    addToShell 'export PATH="/usr/local/bin:$PATH"'
else
  logAlreadyInstalled "Homebrew"
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