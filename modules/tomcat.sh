#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "Apache Tomcat"

enterDirOrExit ~/Coding/servers/
TOMCAT_DOWNLOAD_URL=https://downloads.apache.org/tomcat/tomcat-9/v9.0.31/bin/apache-tomcat-9.0.31.zip
downloadAndUncompress "Apache Tomcat" "$TOMCAT_DOWNLOAD_URL"

TOMCAT_DIRECTORY=$(getFileNameWithoutExtension "$(getFileName "$TOMCAT_DOWNLOAD_URL")")

enterDirOrExit ~/Coding/servers/"$TOMCAT_DIRECTORY"/bin
chmod +x catalina.sh &&

postInstallationLog "Apache Tomcat"
logSummary "Now you can run: 'sh startup.sh' and 'sh shutdown.sh' to start/stop Apache Tomcat."

enterDirOrExit "${CURRENT_DIR}"