#!/bin/bash
# Created by Nahuel Barrios on 18/3/16.
# shellcheck disable=SC1091

enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "Homebrew"
if ! command -v brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    addToShell "export PATH=/usr/local/bin:\$PATH"
else
  logAlreadyInstalled "Homebrew"
fi

logInfo "Updating Homebrew formulas..."
brew update

logInfo "Verifying the Homebrew installation..."
if brew doctor; then
  postInstallationLog "Homebrew"
else
  logError "Your Homebrew installation reported some errors or warnings, review the Homebrew messages to see if any action is needed."
fi

logProgramVersion "Homebrew" "$(brew --version)"