#!/usr/bin/env bash
# Created by Nahuel Barrios.


enterDirOrExit ~/Downloads
downloadAndInstall "GetDeb" http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
downloadAndInstall "PlayDeb" http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb


logInfo "Installing Dropbox, MongoDB and WebP command line tools..."
sudo apt-get -fy install nautilus-dropbox mongodb curl webp


enterDirOrExit ~/Downloads
downloadAndInstall "Mega Sync client" https://mega.nz/linux/MEGAsync/xUbuntu_15.04/amd64/megasync-xUbuntu_15.04_amd64.deb
downloadAndInstall "Mega Nautilus extension" https://mega.nz/linux/MEGAsync/xUbuntu_15.04/amd64/nautilus-megasync-xUbuntu_15.04_amd64.deb
downloadAndInstall "TeamViewer" http://www.teamviewer.com/download/teamviewer_linux.deb
downloadAndInstall "RoboMongo" http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb