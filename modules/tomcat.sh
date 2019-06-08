#!/bin/bash
# Created by Nahuel Barrios on 25/3/16.

enterDirOrExit "${CURRENT_DIR}"

preInstallationLog "Apache Tomcat"

enterDirOrExit ~/Coding/servers/

TOMCAT_DOWNLOAD_URL=http://apache.dattatec.com/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.zip
downloadAndUncompress "Apache Tomcat" "$TOMCAT_DOWNLOAD_URL"

TOMCAT_DIRECTORY=$(getFileNameWithoutExtension "$(getFileName "$TOMCAT_DOWNLOAD_URL")")

enterDirOrExit ~/Coding/servers/"$TOMCAT_DIRECTORY"/bin
chmod +x catalina.sh &&

postInstallationLog "Apache Tomcat"
logInfo "Apache Tomcat configured successfully. Now you can run: 'sh startup.sh' and 'sh shutdown.sh'"

enterDirOrExit "${CURRENT_DIR}"