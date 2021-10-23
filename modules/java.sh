#!/bin/bash
# Created by Nahuel Barrios on 24/3/16.

enterDirOrExit "${CURRENT_DIR}"

if ! command -v java >/dev/null; then
  logSummary "Remember to download the Java Development Toolkit (JDK) from: https://www.oracle.com/ar/java/technologies/javase-downloads.html"

  addToShell "###"
  addToShell "# Java SDK env vars"
  addToShell "##"
  addToShell "export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home"

else
  logAlreadyInstalled "Java"
  logProgramVersion "Java" "$(java -version)"
fi