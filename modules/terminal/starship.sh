#!/bin/bash
enterDirOrExit "${CURRENT_DIR}"

if ! command -v starship >/dev/null; then
    preInstallationLog "Starship"
    if isOsx "$PLATFORM"; then
        brew install starship
    else
        curl -sS https://starship.rs/install.sh | sh
    fi
    postInstallationLog "Starship"
else
    logAlreadyInstalled "Starship"
fi

if [ -f ~/.zshrc ] && ! grep -q "starship init zsh" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "# Starship prompt" >> ~/.zshrc
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi
if [ -f ~/.bashrc ] && ! grep -q "starship init bash" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Starship prompt" >> ~/.bashrc
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

logProgramVersion "Starship" "$(starship --version)"
