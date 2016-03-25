#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####

if isUbuntu "$PLATFORM"; then
    log "#### Adding particular software repositories ####"

    log "Installing gdebi package manager..."
    sudo apt-get -fy install gdebi

    log "Updating software sources. Required after adding ppa repositories."
    sudo apt-get update

    log "Fixing current packages..."
    sudo apt-get -f install

    log "Removing packages that are not necessary to prevent conflicts..."
    sudo apt-get autoremove

    log "#### Software repositories and packages updated ok ####"
else
    . modules/homebrew.sh
fi

# Remember that oh-my-zsh.sh requires Homebrew.sh.
. modules/oh-my-zsh.sh

. modules/git.sh
. modules/ssh.sh

# Remember that nodejs.sh requires Homebrew.sh.
. modules/nodejs.sh

. modules/sdkman/sdkman.sh
. modules/android.sh
. modules/sublime-text.sh

# Remember that go.sh requires Homebrew.sh.
. modules/go.sh

# Remember that nodejs.sh requires go.sh.
. modules/google-drive.sh

. modules/java.sh
. modules/gimp.sh

# Remember that maven.sh requires Homebrew.sh.
. modules/maven.sh

. modules/google-app-engine.sh

# Remember that heroku.sh requires Homebrew.sh.
. modules/heroku.sh

. modules/tomcat.sh
. modules/mixxx.sh