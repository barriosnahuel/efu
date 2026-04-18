#!/bin/bash
enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "Shell aliases"

addToShell ""
addToShell "# Aliases"
addToShell "alias ll='ls -lAh'"
addToShell "alias la='ls -A'"
addToShell "alias ..='cd ..'"
addToShell "alias ...='cd ../..'"
addToShell "alias grep='grep --color=auto'"

postInstallationLog "Shell aliases"
