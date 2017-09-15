#!/bin/bash
####
# Created by Nahuel Barrios on 17/3/16.
####

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

# Remember that oh-my-zsh.sh requires Homebrew.sh.
. modules/oh-my-zsh.sh

. modules/git.sh
. modules/ssh.sh

. modules/nodejs.sh

. modules/ruby.sh

. modules/android.sh
. modules/sublime-text.sh

# Remember that go.sh requires Homebrew.sh.
. modules/go.sh

# Remember that nodejs.sh requires go.sh.
. modules/google-drive.sh

. modules/java.sh
. modules/gimp.sh
. modules/google-app-engine.sh

# Remember that heroku.sh requires Homebrew.sh.
. modules/heroku.sh

. modules/tomcat.sh
. modules/mixxx.sh

# sdkman at the end because SDKMAN_DIR environment variable must be at the end to work.
. modules/sdkman/sdkman.sh

# Remember that maven.sh requires sdkman.sh.
. modules/maven.sh