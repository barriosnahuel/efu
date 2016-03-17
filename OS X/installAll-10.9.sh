#!/bin/bash
# Script created by Nahuel Barrios: barrios.nahuel@gmail.com
# Last run: 11/12/14
# Just comment the undesired software to skip installing specific software.

# FROM HERE
. ./../createDirectoriesTree.sh
. ./../functions.sh

echo "==> - EFU: Loading properties..."
. ./properties.sh
# TO HERE, IS THE SAME FOR ALL OTHER PLATFORMS

echo "==> - EFU: Adding some aliases to ~/.bash_profile..."
echo "alias ll='ls -la'" >> ~/.bash_profile &&
. ~/.bash_profile &&

echo 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk-macosx' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/tools:$PATH' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> ~/.bash_profile &&
echo "==> - EFU: Successfully added Android path environment variables."

echo "==> - EFU: Installing Gradle..."
curl -O https://downloads.gradle.org/distributions/gradle-2.2.1-bin.zip &&
unzip gradle-2.2.1-bin.zip &&
mv gradle-2.2.1 ~/Coding/xDKs &&
mv gradle-2.2.1-bin.zip ~/Coding/xDKs &&

echo "==> - EFU: Configuring Gradle global properties into file= ~/.gradle/gradle.properties..."
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties

echo "==> - EFU: Updating Gradle PATH variables..." &&
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bash_profile &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bash_profile
echo "==> - EFU: Successfully added Gradle to path environment variable."

echo "==> - EFU: Setting up JAVA_HOME environment variable..."
echo 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home' >> ~/.bash_profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bash_profile

echo "==> - EFU: Installing Ant..." &&
curl -O http://mirrors.dcarsat.com.ar/apache//ant/binaries/apache-ant-1.9.4-bin.zip &&
unzip apache-ant-1.9.4-bin.zip &&
mv apache-ant-1.9.4 ~/Coding/xDKs &&
mv apache-ant-1.9.4-bin.zip ~/Coding/xDKs &&
echo 'export ANT_HOME=$HOME/Coding/xDKs/apache-ant-1.9.4' >> ~/.bash_profile &&
echo 'export PATH=$ANT_HOME/bin:$PATH' >> ~/.bash_profile &&
echo "==> - EFU: Successfully added Ant to path environment variable."

echo "==> - EFU: JDownloader2: Download it from" $JDOWNLOADER