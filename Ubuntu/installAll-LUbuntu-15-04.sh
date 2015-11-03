#!/usr/bin/env bash

# Script created by Nahuel Barrios: Barrios.Nahuel@gmail.com
# Just comment the undesired command lines to skip the installation of specific software.

echo "==> - EFU: To see the installation log run the following line on the command line: tail –f efu.log"

# FROM HERE
. ./../functions.sh

echo "==> - EFU: Loading properties..."
. ./properties.sh
# TO HERE, IS THE SAME FOR ALL OTHER PLATFORMS


log "==> - EFU: ############################## Adding particular software repositories ##############################"

log "==> - EFU: Adding repositories for JDownloader..."
sudo add-apt-repository ppa:jd-team/jdownloader -y

echo "==> - EFU: Updating software sources. Required after adding ppa repositories."
sudo apt-get update

echo "==> - EFU: Fixing current packages..."
sudo apt-get -f install

echo "==> - EFU: Removing packages that are not neccessary to prevent conflicts..."
sudo apt-get autoremove

log "==> - EFU: Installing gdebi package manager..."
sudo apt-get -fy install gdebi

log "==> - EFU: ##############################  Installing favorite software   ##############################"

log "==> - EFU: Instaling latest Rhythmbox and its plugins..."
sudo apt-get -fy install rhythmbox rhythmbox-plugin-rhythmweb rhythmbox-plugin-equalizer rhythmbox-plugin-opencontainingfolder rhythmbox-plugin-llyrics

log "==> - EFU: Installing packages to compress and extract different kind of files..."
sudo apt-get -fy install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract

echo "==> - EFU: Installing JDownloader, Subdownloader, GMountISO, Freemind (a mind maps editor), Gnac (to convert audio files), and a Steam client (will update on first run)..."
sudo apt-get -fy install jdownloader subdownloader gmountiso freemind gnac

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
