#!/usr/bin/env bash

# Script created by Nahuel Barrios: Barrios.Nahuel@gmail.com
# Just comment the undesired command lines to skip the installation of specific software.

echo "==> - EFU: To see the installation log run the following line on the command line: tail –f efu.log"

# FROM HERE
. ./../createDirectoriesTree.sh

echo "==> - EFU: Loading properties..."
. ./properties.sh

echo "==> - EFU: Loading utility functions..."
. ./../functions.sh
# TO HERE, is THE SAME FOR ALL OTHER PLATFORMS


log "==> - EFU: ############################## Adding particular software repositories ##############################"

echo "==> - EFU: Downloading GetDeb and PlayDeb..." &&
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb &&

echo "==> - EFU: Installing GetDeb..." &&
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb &&

echo "==> - EFU: Installing PlayDeb..." &&
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb &&

echo "==> - EFU: Deleting Downloads..." &&
rm -f getdeb-repository_0.1-1~getdeb1_all.deb &&
rm -f playdeb_0.3-1~getdeb1_all.deb
echo "==> - EFU: Till here, steps were taken form: http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-10-utopic-unicorn; Thanks!"

echo "==> - EFU: Adding repositories for Sublime Text 3..."
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

echo "==> - EFU: Adding repositories for Ubuntu Make..."
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

echo "==> - EFU: Adding repositories for Grive (a Google Drive unofficial client)..."
sudo apt-add-repository ppa:thefanclub/grive-tools -y

echo "==> - EFU: Adding repositories for JDownloader..."
sudo add-apt-repository ppa:jd-team/jdownloader -y

echo "==> - EFU: Adding repositories for Mixxx DJ software..."
sudo add-apt-repository ppa:mixxx/mixxx -y

echo "==> - EFU: Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y

echo "==> - EFU: Updating software sources. Required after adding ppa repositories."
sudo apt-get update

echo "==> - EFU: Fixing current packages..."
sudo apt-get -f install

echo "==> - EFU: Removing packages that are not neccessary to prevent conflicts..."
sudo apt-get autoremove

echo "==> - EFU: Installing gdebi package manager..."
sudo apt-get -fy install gdebi

echo "==> - EFU: ##############################  Installing favorite software   ##############################"

echo "==> - EFU: Installing Google Chrome (stable version)..."
if [ $(getconf LONG_BIT) = "64" ]
then
    log "==> - EFU: 64bit Detected" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    sudo dpkg -i google-chrome-stable_current_amd64.deb &&
    rm -f google-chrome-stable_current_amd64.deb &&
    log "==> - EFU: Google Chrome (amd64) successfully installed."
else
    log "==> - EFU: 32bit Detected"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
    sudo dpkg -i google-chrome-stable_current_i386.deb &&
    rm -f google-chrome-stable_current_i386.deb &&
    log "==> - EFU: Google Chrome (x86) successfully installed."
fi

echo "==> - EFU: Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics

echo "==> - EFU: Instaling Sublime Text 3, GIT, MongoDB, Curl and WebP command line tools..."
sudo apt-get -fy install sublime-text-installer git-core mongodb curl webp

echo "==> - EFU: Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract

echo "==> - EFU: Installing Grive: a Google Drive unofficial client..."
sudo apt-get -fy install -y grive-tools

echo "==> - EFU: Installing Mixxx DJ software..."
sudo apt-get -fy install mixxx libportaudio2

# Mega
echo "==> - EFU: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - EFU: Installing Mega sync client..." &&
sudo gdebi megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - EFU: Deleting Mega Sync client downloaded file..." &&
rm -f megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - EFU: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/nautilus-megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - EFU: Installing Mega Nautilus extension..." &&
sudo dpkg -i nautilus-megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - EFU: Deleting Mega Nautilus extension downloaded file after successfull installation..." &&
rm -f nautilus-megasync-xUbuntu_14.04_amd64.deb &&
log "==> - EFU: MEGA installed successfully."

echo "==> - EFU: Installing Dropbox and XClip (to copy into clipboard from terminal),..."
sudo apt-get -fy install nautilus-dropbox xclip


echo "==> - EFU: Generating an SSH Key..." &&
#   Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C "barrios.nahuel@gmail.com" &&
#   start the ssh-agent in the background
eval "$(ssh-agent-s)" &&
ssh-add ~/.ssh/id_rsa &&
log "==> - EFU: SSH Key for barrios.nahuel@gmail.com successfully generated in ~/.ssh/id_rsa.pub"

xclip -sel clip < ~/.ssh/id_rsa.pub &&
log "==> - EFU: SSH Key copied to clipboard."

log "==> - EFU: ################ Installing development kits ################"

cd ~/Coding/xDKs/ &&

echo "==> - EFU: Installing and configuring the Android development environment..." &&
sudo apt-get install ubuntu-make &&
umake android &&

echo "==> - EFU: Configuring Android SDK environment variables..." &&
echo 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk' >> ~/.bashrc &&
echo 'export PATH=$ANDROID_HOME/tools:$PATH' >> ~/.bashrc &&
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> ~/.bashrc &&
log "==> - EFU: Android SDK installed and configured successfully"

echo "==> - EFU: Installing Ant..." &&
wget http://mirrors.dcarsat.com.ar/apache//ant/binaries/apache-ant-1.9.4-bin.zip &&
unzip apache-ant-1.9.4-bin.zip &&
echo 'export ANT_HOME=$HOME/Coding/xDKs/apache-ant-1.9.4' >> ~/.bashrc &&
echo 'export PATH=$ANT_HOME/bin:$PATH' >> ~/.bashrc &&
log "==> - EFU: Ant Installed and configured successfully."

echo "==> - EFU: Installing Maven..." &&
wget http://mirrors.nxnethosting.com/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip &&
unzip apache-maven-3.2.5-bin.zip &&
echo 'export M2_HOME=$HOME/Coding/xDKs/apache-maven-3.2.5' >> ~/.bashrc &&
echo 'export PATH=$M2_HOME/bin:$PATH' >> ~/.bashrc &&
log "==> - EFU: Maven installed and configured successfully."

echo "==> - EFU: Installing Gradle..." &&
wget https://services.gradle.org/distributions/gradle-2.2.1-bin.zip &&
unzip gradle-2.2.1-bin.zip &&
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bashrc &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bashrc &&
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties &&
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties &&
log "==> - EFU: Gradle installed and configured successfully."

echo "==> - EFU: Installing NodeJS..." &&

wget http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz &&
tar -zxf node-v0.12.2-linux-x64.tar.gz &&
echo 'export PATH=$HOME/Coding/xDKs/node-v0.12.2-linux-x64/bin:$PATH' >> ~/.bashrc &&

. ~/.bashrc &&
log "==> - EFU: NodeJS installed and configured successfully."

echo "==> - EFU: Installing NPM package manager (latest version)..." &&
curl https://www.npmjs.com/install.sh | sh &&
log "==> - EFU: NPM successfully installed."

echo "==> - EFU: Installing via the NPM package manager: Apache Cordova and Plugman (a command line tool to install and uninstall plugins for use with Apache Cordova projects), Mocha (for testing) and Bower..." &&
npm install -g cordova plugman mocha bower &&

echo "==> - EFU: Installing Heroku toolbelt to run Heroku commands from command line..." &&
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh &&
echo "==> - EFU: Please login against Heroku with your account." &&
heroku login &&
echo "==> - EFU: Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add &&
log "==> - EFU: Heroku configured successfully."


log "==> - EFU: ################ Finished installing development kits ################"
cd ~/Downloads/


echo "==> - EFU: Installing Intellij IDEA Ultimate Edition..." &&
cd ~/Coding/IDEs/
wget http://download-cf.jetbrains.com/idea/ideaIU-14.1.2.tar.gz &&
tar -zxf ideaIU-14.1.2.tar.gz &&
echo "==> - EFU: Setting up JAVA_HOME environment variable pointing to a JDK 8 to use as default java command." &&
echo 'export JAVA_HOME=$HOME/Coding/xDKs/jdk1.8.0_45' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc

cd ~/Downloads/

echo "==> - EFU: Installing VirtualBox (Genymotion dependency)..." &&
wget http://download.virtualbox.org/virtualbox/4.3.20/virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb &&
sudo dpkg -i virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb &&
rm virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb

echo "==> - EFU: Installing Genymotion Android emulator..." &&
wget http://files2.genymotion.com/genymotion/genymotion-2.3.1/genymotion-2.3.1_x64.bin &&
chmod +x genymotion-2.3.1_x64.bin &&
mv genymotion-2.3.1_x64.bin ~/Coding/xDKs &&
log "==> - EFU: [IMPORTANT] Genymotion was not installed. You must go to ~/Coding/xDKs and install it manually."

echo "==> - EFU: Installing Gimp..."
sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras

echo "==> - EFU: Installing JDownloader, Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)..."
sudo apt-get -fy install jdownloader subdownloader gmountiso freemind gnac steam

echo "==> - EFU: Installing TeamViewer..." &&
wget http://www.teamviewer.com/download/teamviewer_linux.deb &&
sudo gdebi teamviewer_linux.deb &&
rm teamviewer_linux.deb &&
log "==> - EFU: TeamViewer successfully installed."

echo "==> - EFU: Installing RoboMongo (A MongoDB GUI)..." &&
wget http://robomongo.org/files/linux/robomongo-0.8.4-x86_64.deb &&
sudo gdebi robomongo-0.8.4-x86_64.deb &&
rm robomongo-0.8.4-x86_64.deb &&

echo "==> - EFU: Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

log "==> - EFU: Updating installed packages..."
sudo apt-get upgrade

log "==> - EFU: ##############################  Finished installation of favorite software   ##############################"
log "==> - EFU: Thanks for using me! --- Don't forget to fork me on Github: http://github.com/barriosnahuel/efu ###########"
echo "==> - EFU: To see the installation log run the following line on the command line: tail –f efu.log"
