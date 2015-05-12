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

log "==> - EFU: Adding repositories for Sublime Text 3..."
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

log "==> - EFU: Adding repositories for Ubuntu Make..."
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

log "==> - EFU: Adding repositories for Grive (a Google Drive unofficial client)..."
sudo apt-add-repository ppa:thefanclub/grive-tools -y

log "==> - EFU: Adding repositories for JDownloader..."
sudo add-apt-repository ppa:jd-team/jdownloader -y

log "==> - EFU: Adding repositories for Mixxx DJ software..."
sudo add-apt-repository ppa:mixxx/mixxx -y

log "==> - EFU: Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y

echo "==> - EFU: Updating software sources. Required after adding ppa repositories."
sudo apt-get update

echo "==> - EFU: Fixing current packages..."
sudo apt-get -f install

echo "==> - EFU: Removing packages that are not neccessary to prevent conflicts..."
sudo apt-get autoremove

log "==> - EFU: Installing gdebi package manager..."
sudo apt-get -fy install gdebi

log "==> - EFU: ##############################  Installing favorite software   ##############################"

downloadAndInstall "GetDeb" http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
downloadAndInstall "PlayDeb" http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb

# Install Google Chrome
if [ $(getconf LONG_BIT) = "64" ]
then
    log "==> - EFU: 64bit machine detected" &&
    downloadAndInstall "Google Chrome (amd64)" $GOOGLE_CHROME
else
    log "==> - EFU: 32bit machine detected"
    downloadAndInstall "Google Chrome (x86)" $GOOGLE_CHROME
fi

log "==> - EFU: Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics

log "==> - EFU: Instaling Sublime Text 3, GIT, MongoDB and WebP command line tools..."
sudo apt-get -fy install sublime-text-installer git-core mongodb curl webp

log "==> - EFU: Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract

log "==> - EFU: Installing Grive: a Google Drive unofficial client..."
sudo apt-get -fy install -y grive-tools

log "==> - EFU: Installing Mixxx DJ software..."
sudo apt-get -fy install mixxx libportaudio2

downloadAndInstall "Mega Sync client" $MEGA
downloadAndInstall "Mega Nautilus extension" $MEGA_NAUTILUS

log "==> - EFU: Installing Dropbox and XClip (to copy into clipboard from terminal),..."
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

echo "==> - EFU: Installing and configuring the Android development environment..." &&
sudo apt-get install ubuntu-make &&
umake android &&

cd ~/Coding/xDKs/ &&

echo "==> - EFU: Configuring Android SDK environment variables..." &&
echo 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk' >> ~/.bashrc &&
echo 'export PATH=$ANDROID_HOME/tools:$PATH' >> ~/.bashrc &&
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> ~/.bashrc &&
. ~/.bashrc &&
log "==> - EFU: Android SDK installed and configured successfully"

echo "==> - EFU: Installing Apache Ant..." &&
downloadAndUncompress "Apache Ant" http://mirrors.dcarsat.com.ar/apache//ant/binaries/apache-ant-1.9.4-bin.zip &&
echo 'export ANT_HOME=$HOME/Coding/xDKs/apache-ant-1.9.4' >> ~/.bashrc &&
echo 'export PATH=$ANT_HOME/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc &&
log "==> - EFU: Apache Ant configured successfully."

echo "==> - EFU: Installing Apache Maven..." &&
downloadAndUncompress "Apache Maven" http://mirrors.nxnethosting.com/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip
echo 'export M2_HOME=$HOME/Coding/xDKs/apache-maven-3.2.5' >> ~/.bashrc &&
echo 'export PATH=$M2_HOME/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc &&
log "==> - EFU: Apache Maven configured successfully."

echo "==> - EFU: Installing Gradle..." &&
downloadAndUncompress "Gradle" https://services.gradle.org/distributions/gradle-2.2.1-bin.zip
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bashrc &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc &&
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties &&
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties &&
log "==> - EFU: Gradle installed and configured successfully."

echo "==> - EFU: Installing NodeJS..." &&

downloadAndUncompress "NodeJS" http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz &&
echo 'export PATH=$HOME/Coding/xDKs/node-v0.12.2-linux-x64/bin:$PATH' >> ~/.bashrc &&

. ~/.bashrc &&
log "==> - EFU: NodeJS installed and configured successfully."

echo "==> - EFU: Installing NPM package manager (latest version)..." &&
curl https://www.npmjs.com/install.sh | sh &&
log "==> - EFU: NPM successfully installed."

echo "==> - EFU: Installing via the NPM package manager: Apache Cordova and Plugman (a command line tool to install and uninstall plugins for use with Apache Cordova projects), Mocha (for testing) and Bower..." &&
npm install -g cordova plugman mocha bower &&

echo "==> - EFU: Installing Heroku toolbelt to run Heroku commands from command line..." &&
wget -qO- $HEROKU | sh &&
echo "==> - EFU: Please login against Heroku with your account." &&
heroku login &&
echo "==> - EFU: Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add &&
log "==> - EFU: Heroku configured successfully."


log "==> - EFU: ################ Finished installing development kits ################"

echo "==> - EFU: Installing Intellij IDEA Ultimate Edition..." &&
cd ~/Coding/IDEs/
downloadAndUncompress "Intellij IDEA Ultimate Edition" http://download-cf.jetbrains.com/idea/ideaIU-14.1.2.tar.gz &&
echo "==> - EFU: Setting up JAVA_HOME environment variable pointing to a JDK 8 to use as default java command." &&
echo 'export JAVA_HOME=$HOME/Coding/xDKs/jdk1.8.0_45' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc


echo "==> - EFU: Installing Gimp with some plugins..."
sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras

echo "==> - EFU: Installing JDownloader, Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)..."
sudo apt-get -fy install jdownloader subdownloader gmountiso freemind gnac steam

cd ~/Downloads/
downloadAndInstall "TeamViewer" http://www.teamviewer.com/download/teamviewer_linux.deb
downloadAndInstall "RoboMongo" http://robomongo.org/files/linux/robomongo-0.8.4-x86_64.deb

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