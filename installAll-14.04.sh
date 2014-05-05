#!/bin/bash
#   Script created by Nahuel Barrios: barrios.nahuel@gmail.com
#   Just comment the undesired software at the: "sudo apt-get install" line to skip installing specific software.

##############################  Add particular software repositories    ##############################

#Add Oracle JDK repository
sudo add-apt-repository ppa:webupd8team/java

#Add repositories for Grive (a Google Drive unofficial client)
sudo apt-add-repository ppa:thefanclub/grive-tools

#Add repositories for JDownloader.
sudo add-apt-repository ppa:jd-team/jdownloader

#Add repositories for Sublime Text 3.
sudo add-apt-repository ppa:webupd8team/sublime-text-3

#Add repositories for RabbitVCS integration with Nautilus. Like TortoiseSVN.
sudo add-apt-repository ppa:rabbitvcs/ppa

#Add repositories for Mixxx DJ software.
sudo add-apt-repository ppa:mixxx/mixxx

#Add repositories for WineHQ.
sudo add-apt-repository ppa:ubuntu-wine/ppa

#Update software sources. Required after adding a ppa repository.
sudo apt-get update

#Remove packages that are not neccessary to prevent conflicts.
sudo apt-get autoremove


##############################  Install favorite software   ##############################


#Install GIT
# Maven
# MongoDB
# Curl
sudo apt-get install git-core maven mongodb curl

#Install NodeJS and NPM.
# Gist taken from: https://gist.github.com/isaacs/579814
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
. ~/.bashrc
mkdir ~/local
mkdir ~/node-latest-install
cd ~/node-latest-install
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local
make install # ok, fine, this step probably takes more than 30 seconds...
curl https://www.npmjs.org/install.sh | sh

#Install software via NPM package manager.

#Install Apache Cordova
npm install -g cordova

#Install Plugman, a command line tool to install and uninstall plugins for use with Apache Cordova projects. (https://github.com/apache/cordova-plugman)
npm install -g plugman

#Install Mocha (for testing)
npm install -g mocha

#Install Heroku toolbelt to run Heroku commands from command line.
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
#Login against Heroku with your account.
heroku login
#Add existent public keys to Heroku to be able to run commands.
heroku keys:add

#Install
# Wine
# Dependencies to rar/unrar files
# Sublime Text 3 (beta)
# Subtitle downloader
# GIMP (image editor).
sudo apt-get install wine1.6 unrar rar sublime-text-installer subdownloader gimp

#Install Java JDK and set as default.
sudo apt-get install oracle-jdk7-installer oracle-java7-set-default

#Install a Google Drive unofficial client
sudo apt-get install -y grive-tools

#Install JDownloader,
# Dropbox, Freemind (mind maps editor), GMountISO, Mixxx dj software, Steam client (will update on first usage)
sudo apt-get install jdownloader nautilus-dropbox freemind gmountiso mixxx steam

#Install TeamViewer
wget http://www.teamviewer.com/download/teamviewer_linux.deb
sudo apt-get install gdebi
sudo gdebi teamviewer_linux.deb
rm teamviewer_linux.deb


##############################      Run final commands      ##############################

#Remove packages that are not neccessary
sudo apt-get autoremove
