#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

if isUbuntu "$PLATFORM"; then
    sudo apt-get -fy install git
fi

git config --global user.name "Nahuel Barrios"
git config --global user.email barrios.nahuel@gmail.com
git config --global push.default simple