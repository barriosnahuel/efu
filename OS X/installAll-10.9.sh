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
cd .. &&
mkdir xDKs &&
cd .. &&
mkdir servers &&
cd .. &&	
mkdir workspace &&
cd .. &&
mkdir workspace-mine &&
cd .. &&
mkdir workspace-test &&

echo "==> - NB: Downloading .dmg files to install favourite software..."
cd ~/Downloads

#TODO : Use variables here instead of the full URL.

curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg https://dl.google.com/drive/installgoogledrive.dmg https://mega.co.nz/MEGAsyncSetup.dmg

curl -O http://download-cf.jetbrains.com/idea/ideaIU-14.0.2.dmg
curl -O http://download-cf.jetbrains.com/idea/ideaIC-14.0.2.dmg

curl -O https://dl.google.com/dl/android/studio/install/1.0.0/android-studio-ide-135.1629389.dmg

echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties

echo "==> - NB: Installing Gradle..."
curl -O https://downloads.gradle.org/distributions/gradle-2.2.1-bin.zip &&
unzip gradle-2.2.1-bin.zip &&
mv gradle-2.2.1 ~/Coding/xDKs &&
mv gradle-2.2.1-bin.zip ~/Coding/xDKs &&

echo "==> - NB: Updating PATH variables..." &&
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bash_profile &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bash_profile
echo "==> - NB: Successfully added Gradle to path environment variable."