#!/usr/bin/env bash
# Created by Nahuel Barrios on 15/04/15. Contact me at: Barrios.Nahuel@gmail.com

. ./functions.sh

log "#### Creating directories tree ####"

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
mkdir Songs\ Lyrics
mkdir VMs &&

log "Directories tree successfully created."

cd ~/Downloads/
