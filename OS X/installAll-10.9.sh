#!/bin/bash
# Script created by Nahuel Barrios: barrios.nahuel@gmail.com
# Last run: 11/12/14
# Just comment the undesired software to skip installing specific software.

echo "==> - NB: Adding some aliases to ~/.bash_profile..."
echo "alias ll='ls -la'" >> ~/.bash_profile &&
. ~/.bash_profile &&

echo "==> - NB: ############################## Creating directories tree ##############################"
echo "==> - NB: Creating directories tree..."
cd ~/ &&
mkdir Coding &&
cd Coding &&
mkdir IDEs &&
mkdir xDKs &&
mkdir servers &&
mkdir workspace-mine &&
mkdir workspace-test &&
mkdir workspace-work &&
echo "==> - NB: Directories tree successfully created."

echo "==> - NB: Downloading .dmg files to install favourite software..."
cd ~/Downloads

#TODO : Use variables here instead of the full URL.

curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
curl -O https://dl.google.com/dl/android/studio/install/1.0.0/android-studio-ide-135.1629389.dmg
curl -O https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg
curl -O https://dl.google.com/drive/installgoogledrive.dmg
curl -O https://mega.co.nz/MEGAsyncSetup.dmg
curl -O http://download-cf.jetbrains.com/idea/ideaIU-14.0.2.dmg
curl -O http://nodejs.org/dist/v0.10.35/node-v0.10.35.pkg
curl -O https://s3.amazonaws.com/assets.heroku.com/heroku-toolbelt/heroku-toolbelt.pkg
curl -O https://transmission.cachefly.net/Transmission-2.84.dmg
curl -O http://download-cf.jetbrains.com/idea/ideaIC-14.0.2.dmg

echo 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk-macosx' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/tools:$PATH' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> ~/.bash_profile &&
echo "==> - NB: Successfully added Android path environment variables."

echo "==> - NB: Installing Gradle..."
curl -O https://downloads.gradle.org/distributions/gradle-2.2.1-bin.zip &&
unzip gradle-2.2.1-bin.zip &&
mv gradle-2.2.1 ~/Coding/xDKs &&
mv gradle-2.2.1-bin.zip ~/Coding/xDKs &&

echo "==> - NB: Configuring Gradle global properties into file= ~/.gradle/gradle.properties..."
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties

echo "==> - NB: Updating Gradle PATH variables..." &&
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bash_profile &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bash_profile
echo "==> - NB: Successfully added Gradle to path environment variable."

echo "==> - NB: Setting up JAVA_HOME environment variable..."
echo 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home' >> ~/.bash_profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bash_profile

echo "==> - NB: Installing Ant..." &&
curl -O http://mirrors.dcarsat.com.ar/apache//ant/binaries/apache-ant-1.9.4-bin.zip &&
unzip apache-ant-1.9.4-bin.zip &&
mv apache-ant-1.9.4 ~/Coding/xDKs &&
mv apache-ant-1.9.4-bin.zip ~/Coding/xDKs &&
echo 'export ANT_HOME=$HOME/Coding/xDKs/apache-ant-1.9.4' >> ~/.bash_profile &&
echo 'export PATH=$ANT_HOME/bin:$PATH' >> ~/.bash_profile &&
echo "==> - NB: Successfully added Ant to path environment variable."