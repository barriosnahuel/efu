#!/bin/bash
# Created by Nahuel Barrios on 27/3/16.
# shellcheck disable=SC1091

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


preInstallationLog "Curl, Subdownloader, GMountISO, Freemind (a mind maps editor), Sound Converter, Steam client (will update on first run) and PlayOnLinux"
sudo apt-get -fy install curl subdownloader gmountiso freemind soundconverter steam playonlinux
postInstallationLog "Subdownloader, GMountISO, Freemind (a mind maps editor), Sound Converter, Steam client (will update on first run) and PlayOnLinux"


if isUbuntu "$PLATFORM"; then
    # shellcheck source=installAll-15.04.sh
    . ./installAll-15.04.sh
fi

logInfo "Cleaning up..." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

logInfo "Updating installed packages..."
sudo apt-get upgrade