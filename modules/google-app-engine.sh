#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

preInstallationLog "Google App Engine SDK"

cd ~/Coding/xDKs/
downloadAndUncompress "Google App Engine SDK" https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.34.zip
cd ~/Downloads/

addToShell 'export PATH=$PATH:$HOME/Coding/xDKs/appengine-java-sdk-1.9.34/'

postInstallationLog "Google App Engine SDK"