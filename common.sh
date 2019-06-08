#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####
# shellcheck disable=SC1091

if isOsx "$PLATFORM"; then
    . modules/homebrew.sh
else
    log "Installing gdebi package manager..."
    sudo apt-get -fy install gdebi

    log "Updating software sources. Required after adding ppa repositories."
    sudo apt-get update

    log "Fixing current packages..."
    sudo apt-get -f install

    log "Removing packages that are not necessary to prevent conflicts..."
    sudo apt-get autoremove

    log "#### Software repositories and packages updated ok ####"
fi

if isLubuntu "$PLATFORM"; then
    return 0
fi

# shellcheck source=modules/git.sh
. modules/git.sh

# shellcheck source=modules/ssh.sh
. modules/ssh.sh

# Remember that oh-my-zsh.sh requires Homebrew.sh.
# shellcheck source=modules/oh-my-zsh.sh
. modules/oh-my-zsh.sh

# Remember that jq.sh requires Homebrew.sh.
# shellcheck source=modules/jq.sh
. modules/jq.sh

# shellcheck source=modules/nodejs.sh
. modules/nodejs.sh

# shellcheck source=modules/ruby.sh
. modules/ruby.sh

# shellcheck source=modules/android.sh
. modules/android.sh

# shellcheck source=modules/sublime-text.sh
. modules/sublime-text.sh

# Remember that go.sh requires Homebrew.sh.
# shellcheck source=modules/go.sh
. modules/go.sh

# Remember that nodejs.sh requires go.sh.
# shellcheck source=modules/google-drive.sh
. modules/google-drive.sh

# shellcheck source=modules/java.sh
. modules/java.sh

# shellcheck source=modules/gimp.sh
. modules/gimp.sh

# Remember that heroku.sh requires Homebrew.sh.
# shellcheck source=modules/heroku.sh
. modules/heroku.sh

# shellcheck source=modules/tomcat.sh
. modules/tomcat.sh

# shellcheck source=modules/mixxx.sh
. modules/mixxx.sh

# sdkman at the end because SDKMAN_DIR environment variable must be at the end to work.
# shellcheck source=modules/sdkman.sh
. modules/sdkman/sdkman.sh

# Remember that maven.sh requires sdkman.sh.
# shellcheck source=modules/maven.sh
. modules/maven.sh