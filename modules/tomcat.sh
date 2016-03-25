#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

preInstallationLog "Apache Tomcat"

cd ~/Coding/servers/

TOMCAT_DOWNLOAD_URL=http://apache.dattatec.com/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.zip
downloadAndUncompress "Apache Tomcat" "$TOMCAT_DOWNLOAD_URL"

TOMCAT_DIRECTORY=$(getFileNameWithoutExtension "$(getFileName "$TOMCAT_DOWNLOAD_URL")")

cd ~/Coding/servers/"$TOMCAT_DIRECTORY"/bin &&
chmod +x catalina.sh &&

cd ~/Downloads/

postInstallationLog "Apache Tomcat"
logInfo "Apache Tomcat configured successfully. Now you can run: 'sh startup.sh' and 'sh shutdown.sh'"