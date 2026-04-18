#!/bin/bash
enterDirOrExit "${CURRENT_DIR}"

if ! command -v claude >/dev/null; then
    preInstallationLog "Claude Code"
    curl -fsSL https://claude.ai/install.sh | bash
    addToShell ""
    addToShell 'export PATH="$HOME/.local/bin:$PATH"'
    postInstallationLog "Claude Code"
else
    logAlreadyInstalled "Claude Code"
fi

logProgramVersion "Claude Code" "$(claude --version)"
