#!/usr/bin/env bash
# Created by Nahuel Barrios.
# Just comment the undesired command lines to skip the installation of specific software.

log "#### Installing favorite software ####"

downloadAndInstall "GetDeb" http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
downloadAndInstall "PlayDeb" http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb

logInfo "Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y
sudo apt-get update

log "Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics

logInfo "Adding repositories for Sublime Text 3..."
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update

log "Instaling Sublime Text 3"
sudo apt-get -fy install sublime-text-installer

log "Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract

logInfo "Adding repositories for Mixxx DJ software..."
sudo add-apt-repository ppa:mixxx/mixxx -y
sudo apt-get update

log "Installing Mixxx DJ software..."
sudo apt-get -fy install mixxx libportaudio2

downloadAndInstall "Mega Sync client" $MEGA
downloadAndInstall "Mega Nautilus extension" $MEGA_NAUTILUS

log "Installing Dropbox, XClip (to copy into clipboard from terminal), MongoDB and WebP command line tools..."
sudo apt-get -fy install nautilus-dropbox xclip mongodb curl webp


log "Generating an SSH Key..." &&
#   Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C $USER_EMAIL &&
#   start the ssh-agent in the background
eval "$(ssh-agent-s)" &&
ssh-add ~/.ssh/id_rsa &&
log "SSH Key for $USER_EMAIL successfully generated in ~/.ssh/id_rsa.pub"

xclip -sel clip < ~/.ssh/id_rsa.pub &&
log "SSH Key copied to clipboard."


log "#### Installing development kits ####"


log "Installing Heroku toolbelt to run Heroku commands from command line..." &&
wget -qO- "https://toolbelt.heroku.com/install-ubuntu.sh" | sh &&
log "Please login against Heroku with your account." &&
heroku login &&
log "Adding existent public keys to Heroku to be able to run commands..." &&
heroku keys:add &&
log "Heroku configured successfully."


log "################ Finished installing development kits ################"


cd ~/Coding/servers/
downloadAndUncompress "Apache Tomcat" "http://apache.dattatec.com/tomcat/tomcat-8/v8.0.27/bin/apache-tomcat-8.0.27.zip"
TOMCAT_DIRECTORY=$(getFileNameWithoutExtension $(getFileName $APACHE_TOMCAT))
cd ~/Coding/servers/$TOMCAT_DIRECTORY/bin &&
chmod +x catalina.sh &&
log "Apache Tomcat configured successfully. Now you can run: 'sh startup.sh' and 'sh shutdown.sh'"


preInstallationLog "Gimp (with some plugins)"
sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras
postInstallationLog "Gimp (with some plugins)"


preInstallationLog "Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)"
sudo apt-get -fy install subdownloader gmountiso freemind gnac steam


cd ~/Downloads/
downloadAndInstall "TeamViewer" http://www.teamviewer.com/download/teamviewer_linux.deb
downloadAndInstall "RoboMongo" http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb


log "Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

log "Updating installed packages..."
sudo apt-get upgrade