#!/usr/bin/env bash
# Created by Nahuel Barrios.
# Just comment the undesired command lines to skip the installation of specific software.


cd ~/Downloads/
downloadAndInstall "GetDeb" http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
downloadAndInstall "PlayDeb" http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb


log "Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract


logInfo "Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y
sudo apt-get update
log "Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics


logInfo "Adding repositories for Mixxx DJ software..."
sudo add-apt-repository ppa:mixxx/mixxx -y
sudo apt-get update
log "Installing Mixxx DJ software..."
sudo apt-get -fy install mixxx libportaudio2


log "Installing Dropbox, MongoDB and WebP command line tools..."
sudo apt-get -fy install nautilus-dropbox mongodb curl webp


preInstallationLog "Gimp (with some plugins)"
sudo apt-get -fy install gimp gimp-data gimp-plugin-registry gimp-data-extras
postInstallationLog "Gimp (with some plugins)"


preInstallationLog "Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)"
sudo apt-get -fy install subdownloader gmountiso freemind gnac steam


cd ~/Downloads/
downloadAndInstall "Mega Sync client" https://mega.nz/linux/MEGAsync/xUbuntu_15.04/amd64/megasync-xUbuntu_15.04_amd64.deb
downloadAndInstall "Mega Nautilus extension" https://mega.nz/linux/MEGAsync/xUbuntu_15.04/amd64/nautilus-megasync-xUbuntu_15.04_amd64.deb
downloadAndInstall "TeamViewer" http://www.teamviewer.com/download/teamviewer_linux.deb
downloadAndInstall "RoboMongo" http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb


log "Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

log "Updating installed packages..."
sudo apt-get upgrade