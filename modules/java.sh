#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v java >/dev/null; then
  logSummary "Remember to download the Java Development Toolkit (JDK) from: https://www.oracle.com/ar/java/technologies/javase-downloads.html"
else
  logAlreadyInstalled "Java"
  logProgramVersion "Java" "$(java -version)"
fi