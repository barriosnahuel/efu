#!/bin/bash
# Script created by Nahuel Barrios: barrios.nahuel@gmail.com
# Just comment the undesired software to skip installing specific software.

echo "==> - NB: ############################## Creating directories tree ##############################"
echo "==> - NB: Creating directories tree..."
cd ~/ &&
mkdir Coding &&
cd Coding &&
mkdir IDEs &&
cd .. &&
mkdir xDKs &&
cd .. &&
mkdir servers &&
cd .. &&
mkdir workspace &&
cd .. &&
mkdir workspace-mine &&
cd .. &&
mkdir workspace-test &&

echo "==> - NB: Adding some alias to ~/.bash_profiles..."
echo "alias ll='ls -la'" >> ~/.bash_profiles &&
. ~/.bash_profiles &&