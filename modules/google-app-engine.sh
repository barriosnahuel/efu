#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

cd "${CURRENT_DIR}" || echo "Failed cding into EFU's execution directory, exiting..." && exit

preInstallationLog "Google App Engine SDK"

cd ~/Coding/xDKs/
downloadAndUncompress "Google App Engine SDK" https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.34.zip
cd ~/Downloads/

# shellcheck disable=SC2016
addToShell 'export PATH=$PATH:$HOME/Coding/xDKs/appengine-java-sdk-1.9.34/'

postInstallationLog "Google App Engine SDK"
logInfo "Remember that Google App Engine requires Java7 to compile. If you're using Java8 then be sure to set the javac compiler flags to generate 1.7 bytecode: '-source 1.7 -target 1.7'"