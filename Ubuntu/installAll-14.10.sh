#!/bin/bash
# Script created by Nahuel Barrios: barrios.nahuel@gmail.com
# Just comment the undesired software at the: "sudo apt-get install" line to skip the installation of each specific software.

echo "==> - NB: ############################## Creating directories tree ##############################"
echo "==> - NB: Creating directories tree..."
cd ~/ &&
mkdir .gradle
mkdir Coding &&
cd Coding &&
mkdir IDEs &&
mkdir xDKs &&
mkdir servers &&
mkdir workspace-mine &&
mkdir workspace-test &&
mkdir workspace-work &&
cd .. &&
mkdir Software &&
mkdir VMs &&
echo "==> - NB: Directories tree successfully created."

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

echo "==> - NB: Adding repositories for Mixxx DJ software..."
sudo add-apt-repository ppa:mixxx/mixxx

echo "==> - NB: Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins

echo "==> - NB: Updating software sources. Required after adding ppa repositories."
sudo apt-get update

echo "==> - NB: Removing packages that are not neccessary to prevent conflicts..."
sudo apt-get autoremove

echo "==> - NB: Installing gdebi package manager..."
sudo apt-get -fy install gdebi

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

echo "==> - NB: Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics

echo "==> - NB: Instaling Sublime Text 3, GIT, MongoDB, Curl and WebP command line tools..."
sudo apt-get -fy install sublime-text-installer git-core mongodb curl webp

echo "==> - NB: Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract

echo "==> - NB: Installing Grive: a Google Drive unofficial client..."
sudo apt-get -fy install -y grive-tools

echo "==> - NB: Installing Mixxx DJ software..."
sudo apt-get -fy install mixxx libportaudio2

#	Mega
echo "==> - NB: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - NB: Installing Mega sync client..." &&
sudo gdebi megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - NB: Deleting Mega Sync client downloaded file..." &&
rm -f megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - NB: Downloading Mega Nautilus extension..." &&
wget https://mega.co.nz/linux/MEGAsync/xUbuntu_14.04/amd64/nautilus-megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - NB: Installing Mega Nautilus extension..." &&
sudo dpkg -i nautilus-megasync-xUbuntu_14.04_amd64.deb &&
echo "==> - NB: Deleting Mega Nautilus extension downloaded file after successfull installation..." &&
rm -f nautilus-megasync-xUbuntu_14.04_amd64.deb

echo "==> - NB: Installing Dropbox and XClip (to copy into clipboard from terminal),..."
sudo apt-get -fy install nautilus-dropbox xclip


echo "==> - NB: Generating an SSH Key..." &&
#	Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C "barrios.nahuel@gmail.com" &&
#	start the ssh-agent in the background
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_rsa &&
echo "==> - NB: SSH Key successfully generated in ~/.ssh/id_rsa.pub" &&
xclip -sel clip < ~/.ssh/id_rsa.pub &&
echo "==> - NB: SSH Key copied to clipboard."
#	End SSH Key


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
curl https://www.npmjs.org/install.sh | sh &&
cd ..

echo "==> - NB: Installing via the NPM package manager: Apache Cordova and Plugman (a command line tool to install and uninstall plugins for use with Apache Cordova projects), Mocha (for testing) and Bower..." &&
npm install -g cordova plugman mocha bower &&

echo "==> - NB: Installing Heroku toolbelt to run Heroku commands from command line..." &&
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh &&
echo "==> - NB: Please login against Heroku with your account." &&
heroku login &&
echo "==> - NB: Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add
#	END NODE JS and NPM

echo "==> - NB: Installing Ant..." &&
wget http://mirrors.dcarsat.com.ar/apache//ant/binaries/apache-ant-1.9.4-bin.zip &&
unzip apache-ant-1.9.4-bin.zip &&
mv apache-ant-1.9.4 ~/Coding/xDKs &&
mv apache-ant-1.9.4-bin.zip ~/Coding/xDKs &&
echo 'export ANT_HOME=$HOME/Coding/xDKs/apache-ant-1.9.4' >> ~/.bashrc &&
echo 'export PATH=$ANT_HOME/bin:$PATH' >> ~/.bashrc &&
echo "==> - NB: Successfully added Ant to path environment variable."

echo "==> - NB: Installing Maven..." &&
wget http://mirrors.nxnethosting.com/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip &&
unzip apache-maven-3.2.5-bin.zip &&
mv apache-maven-3.2.5 ~/Coding/xDKs &&
mv apache-maven-3.2.5-bin.zip ~/Coding/xDKs &&
echo 'export M2_HOME=$HOME/Coding/xDKs/apache-maven-3.2.5' >> ~/.bashrc &&
echo 'export PATH=$M2_HOME/bin:$PATH' >> ~/.bashrc &&
echo "==> - NB: Successfully added Maven to path environment variable."

echo "==> - NB: Installing Gradle..." &&
wget https://services.gradle.org/distributions/gradle-2.2.1-bin.zip &&
unzip gradle-2.2.1-bin.zip &&
mv gradle-2.2.1 ~/Coding/xDKs &&
mv gradle-2.2.1-bin.zip ~/Coding/xDKs &&
echo 'export GRADLE_HOME=$HOME/Coding/xDKs/gradle-2.2.1' >> ~/.bashrc &&
echo 'export PATH=$GRADLE_HOME/bin:$PATH' >> ~/.bashrc &&
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties &&
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties &&
echo "==> - NB: Successfully added Gradle to path environment variable."

echo "==> - NB: Installing Intellij IDEA Ultimate Edition..." &&
wget http://download-cf.jetbrains.com/idea/ideaIU-14.0.2.tar.gz &&
tar -zxf ideaIU-14.0.2.tar.gz &&
mv idea-IU-139.659.2 ~/Coding/IDEs &&
mv ideaIU-14.0.2.tar.gz ~/Coding/IDEs


echo "==> - NB: Configuring the Android SDK..." &&
echo 'export ANDROID_HOME=$HOME/Coding/xDKs/android-sdk-linux' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/tools:$PATH' >> ~/.bash_profile &&
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> ~/.bash_profile &&
echo "==> - NB: Successfully installed the Android SDK and added Android path environment variables."


echo "==> - NB: Installing Android Studio..." &&
wget https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip &&
unzip android-studio-ide-135.1641136-linux.zip &&
mv android-studio ~/Coding/IDEs &&
mv android-studio-ide-135.1641136-linux.zip ~/Coding/IDEs

echo "==> - NB: Installing VirtualBox (Genymotion dependency)..." &&
wget http://download.virtualbox.org/virtualbox/4.3.20/virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb &&
sudo dpkg -i virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb &&
rm virtualbox-4.3_4.3.20-96996~Ubuntu~raring_amd64.deb

echo "==> - NB: Installing Genymotion Android emulator..." &&
wget http://files2.genymotion.com/genymotion/genymotion-2.3.1/genymotion-2.3.1_x64.bin &&
chmod +x genymotion-2.3.1_x64.bin &&
mv genymotion-2.3.1_x64.bin ~/Coding/xDKs &&
echo "==> - NB: [IMPORTANT] Genymotion was not installed. You must go to ~/Coding/xDKs and install it manually."

echo "==> - NB: Installing Gimp..."
sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras

echo "==> - NB: Installing JDownloader, Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)..."
sudo apt-get -fy install jdownloader subdownloader gmountiso freemind gnac steam

echo "==> - NB: Installing TeamViewer..." &&
wget http://www.teamviewer.com/download/teamviewer_linux.deb &&
sudo gdebi teamviewer_linux.deb &&
rm teamviewer_linux.deb

echo "==> - NB: Installing RoboMongo (A MongoDB GUI)..." &&
wget http://robomongo.org/files/linux/robomongo-0.8.4-x86_64.deb &&
sudo gdebi robomongo-0.8.4-x86_64.deb &&
rm robomongo-0.8.4-x86_64.deb &&

echo "==> - NB: Installing VMWare Player..." &&
wget https://download3.vmware.com/software/player/file/VMware-Player-6.0.4-2249910.x86_64.bundle?HashKey=0c4f11cf5f2bc7f4f6090d0d7ec2d847&params=%7B%22sourcefilesize%22%3A%22191+MB%22%2C%22dlgcode%22%3A%22PLAYER-604%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22N%22%2C%22downloaduuid%22%3A%2292ccddb2-9d30-49fe-950a-c1dd15e798a1%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%226.0.4%22%2C%22productfamily%22%3A%22VMware+Player%22%7D&AuthKey=1416532138_7f8342052e7d7d7dc710351300285fc8 &&
chmod +x VMware-Player-6.0.4-2249910.x86_64.bundle && 
gksudo bash VMware-Player-6.0.4-2249910.x86_64.bundle &&
mv VMware-Player-6.0.4-2249910.x86_64.bundle ~/VMs

echo "==> - NB: Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

echo "==> - NB: Updating installed packages..."
sudo apt-get upgrade

echo "==> - NB: Thanks for using me! --- Don't forget to fork me on Github: http://github.com/barriosnahuel/efu"
