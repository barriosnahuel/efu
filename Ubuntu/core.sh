#!/bin/bash
# Created by Nahuel Barrios on 27/3/16.
# shellcheck disable=SC1091


sudo apt-get upgrade

########### Chrome https://ubuntuupdates.org/ppa/google_chrome?dist=stable
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'



########### Spotify https://www.spotify.com/us/download/linux/
sudo apt-get install curl
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list



sudo apt-get update 
sudo apt-get install google-chrome-stable
sudo apt-get install spotify-client




preInstallationLog "Gnome System Tools"
sudo apt-get -fy install gnome-system-tools
postInstallationLog "Gnome System Tools"
logInfo "Available programs: network-admin, shares-admin, time-admin, users-admin"


logInfo "Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract


preInstallationLog "GParted with NTFS support"
sudo apt-get -fy install gparted ntfs-3g


logInfo "Adding repositories for Rhythmbox and its plugins..."
sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y
sudo apt-get update
logInfo "Installing latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics


preInstallationLog "Curl, Subdownloader, GMountISO, Sound Converter, Steam client (will update on first run) and PlayOnLinux"
sudo apt-get -fy install curl subdownloader gmountiso soundconverter steam playonlinux
postInstallationLog "Subdownloader, GMountISO, Freemind (a mind maps editor), Sound Converter, Steam client (will update on first run) and PlayOnLinux"


logInfo "Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get -y autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

logInfo "Updating installed packages..."
sudo apt-get upgrade