#!/bin/bash
# Script created by Nahuel Barrios: barrios.nahuel@gmail.com
# Just comment the undesired software at the: "sudo apt-get install" line to skip installing specific software.

echo "==> - NB: ############################## Adding particular software repositories ##############################"

echo "==> - NB: Downloading GetDeb and PlayDeb..." &&
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb &&

echo "==> - NB: Installing GetDeb..." &&
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb &&

echo "==> - NB: Installing PlayDeb..." &&
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb &&

echo "==> - NB: Deleting Downloads..." &&
rm -f getdeb-repository_0.1-1~getdeb1_all.deb &&
rm -f playdeb_0.3-1~getdeb1_all.deb

echo "==> - NB: Steps taken form: http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-10-utopic-unicorn; Thanks!"
echo "==> - NB: ================="

echo "==> - NB: Adding Oracle JDK repository..."
sudo add-apt-repository ppa:webupd8team/java

echo "==> - NB: Adding repositories for Sublime Text 3..."
sudo add-apt-repository ppa:webupd8team/sublime-text-3

echo "==> - NB: Adding repositories for Grive (a Google Drive unofficial client)..."
sudo apt-add-repository ppa:thefanclub/grive-tools

echo "==> - NB: Adding repositories for JDownloader..."
sudo add-apt-repository ppa:jd-team/jdownloader

echo "==> - NB: Updating software sources. Required after adding ppa repositories."
sudo apt-get update

echo "==> - NB: Removing packages that are not neccessary to prevent conflicts..."
sudo apt-get autoremove

echo "==> - NB: Installing gdebi package manager..."
sudo apt-get install gdebi

echo "==> - NB: ##############################  Installing favorite software   ##############################"

echo "==> - NB: Installing Google Chrome (stable version)..."
if [ $(getconf LONG_BIT) = "64" ]
then
	echo "==> - NB: 64bit Detected" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb
else
	echo "==> - NB: 32bit Detected" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb
fi

echo "==> - NB: Installing Java JDK and setting default..."
sudo apt-get install oracle-java8-installer oracle-java8-set-default

echo "==> - NB: Instaling Sublime Text 3, GIT, MongoDB and Curl..."
sudo apt-get install sublime-text-installer git-core mongodb curl

echo "==> - NB: Installing Grive: a Google Drive unofficial client..."
sudo apt-get install -y grive-tools

echo "==> - NB: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb &&

echo "==> - NB: Installing Mega sync client..."
sudo gdebi megasync-xUbuntu_14.04_amd64.deb &&

echo "==> - NB: Deleting Mega Sync client downloaded file..." &&
rm -f megasync-xUbuntu_14.04_amd64.deb &&

echo "==> - NB: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/nautilus-megasync-xUbuntu_14.04_amd64.deb &&

echo "==> - NB: Installing Mega Nautilus extension..." &&
sudo dpkg -i nautilus-megasync-xUbuntu_14.04_amd64.deb &&

echo "==> - NB: Deleting Mega Nautilus extension downloaded file after successfull installation..." &&
rm -f nautilus-megasync-xUbuntu_14.04_amd64.deb

echo "==> - NB: Installing Dropbox..."
sudo apt-get install nautilus-dropbox

#	NODE JS and NPM
echo "==> - NB: Installing NodeJS and NPM... (Gist taken from: https://gist.github.com/isaacs/579814)"
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc &&
. ~/.bashrc &&
mkdir ~/local &&
mkdir ~/node-latest-install &&
cd ~/node-latest-install &&
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1 &&
./configure --prefix=~/local &&
make install &&
curl https://www.npmjs.org/install.sh | sh

echo "==> - NB: Installing via the NPM package manager: Apache Cordova and Plugman (a command line tool to install and uninstall plugins for use with Apache Cordova projects), and Mocha (for testing)..." &&
npm install -g cordova plugman mocha &&

echo "==> - NB: Installing Heroku toolbelt to run Heroku commands from command line..." &&
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh &&
echo "==> - NB: Please login against Heroku with your account." &&
heroku login &&
echo "==> - NB: Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add
#	END NODE JS and NPM

echo "==> - NB: Installing Gimp..."
sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras

echo "==> - NB: Installing XClip (to copy into clipboard from terminal), JDownloader, Subdownloader, GMountISO, Freemind (a mind maps editor), and a Steam client (will update on first run)..."
sudo apt-get install xclip jdownloader subdownloader gmountiso freemind steam

echo "==> - NB: Installing TeamViewer..." &&
wget http://www.teamviewer.com/download/teamviewer_linux.deb &&
sudo apt-get install gdebi &&
sudo gdebi teamviewer_linux.deb &&
rm teamviewer_linux.deb

echo "==> - NB: Installing RoboMongo (A MongoDB GUI)..." &&
wget http://robomongo.org/files/linux/robomongo-0.8.4-x86_64.deb &&
sudo gdebi robomongo-0.8.4-x86_64.deb &&
rm robomongo-0.8.4-x86_64.deb &&

echo "==> - NB: Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

echo "==> - NB: Updating installed packages..."
sudo apt-get upgrade

echo "==> - NB: Thanks for using this script! --- Fork it on Github: http://github.com/barriosnahuel/efu"
