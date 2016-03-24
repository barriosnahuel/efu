#!/bin/bash
# Created by Nahuel Barrios.
# Just comment the undesired software to skip installing specific software.


preInstallationLog "Command line tools"
xcode-select --install
postInstallationLog "Command line tools"


log "Setting up Java environment variables..."
addToShell "export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"

# shellcheck disable=SC2016
addToShell 'export PATH=$JAVA_HOME/bin:$PATH'