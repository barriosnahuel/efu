#!/bin/bash
####
# Created by Nahuel Barrios.
# Just comment the undesired software to skip installing specific software.
####


echo "==> - EFU: Adding some aliases to ~/.bash_profile..."
echo "alias ll='ls -la'" >> ~/.bash_profile &&
. ~/.bash_profile &&


echo "==> - EFU: Setting up JAVA_HOME environment variable..."
echo 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home' >> ~/.bash_profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bash_profile

echo "==> - EFU: JDownloader2: Download it from" $JDOWNLOADER