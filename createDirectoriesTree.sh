#!/usr/bin/env bash
# Created by Nahuel Barrios on 15/04/15. Contact me at: Barrios.Nahuel@gmail.com

logInfo "#### Creating directories tree ####"

cd ~/ &&
mkdir .gradle
mkdir Coding
cd Coding &&
mkdir xDKs
mkdir tools
mkdir workspace-mine
mkdir workspace-test
mkdir workspace-work

addToShell ""
addToShell "###"
addToShell "# Aliases"
addToShell "##"
addToShell "alias mine='cd ~/Coding/workspace-mine'"
addToShell "alias work='cd ~/Coding/workspace-work'"