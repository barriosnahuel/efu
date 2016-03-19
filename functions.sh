#!/bin/sh
# Created by Nahuel Barrios on 15/04/15.

log() {
    echo "EFU ==> $1 $2 $3" &&
    echo "EFU ==> $1 $2 $3" >> ~/Downloads/efu.log
}

logError() {
    echo "EFU ==> ERROR: $1 $2 $3" &&
    echo "EFU ==> ERROR: $1 $2 $3" >> ~/Downloads/efu.log
}

preInstallationLog(){
    log "Installing $1..."
}

postInstallationLog(){
    log "$1 installed ok"
}

isUbuntu(){
    if [ "$1" = "ubuntu" ]; then
        return 0
    else
        return 1
    fi
}

isOsx(){
    if [ "$1" = "osx" ]; then
        return 0
    else
        return 1
    fi
}

getFileName() {
    echo "${1##*/}"
}

getFileExtension() {
    echo "${1##*.}"
}

getFileNameWithoutExtension() {
    echo "${1%.*}"
}

##  Parameters:
# 1. URL
download() {
    curl -O "$1"
}

##  Parameters:
# 1. URL
downloadInBackground() {
    curl -O "$1" &
}

##  Parameters:
# 1. Program name
# 2. URL
install() {
    preInstallationLog "$1"
    FILE=$(getFileName "$2")

    sudo gdebi "$FILE" &&
    postInstallationLog "$1" &&

    rm -f "$FILE"
}

##  Parameters:
# 1. Program name
# 2. URL
downloadAndInstall() {
    download "$2" &&
    install "$1" "$2"
}

##  Parameters:
# 1. Program name
# 2. URL
downloadAndUncompress() {
    download "$2" &&

    # Get file name from path or URL.
    FILE_NAME=$(getFileName "$2") &&

    # Use the file extension to use unzip or tar to uncompress the file.
    if [ "$(getFileExtension "$FILE_NAME")" = "zip" ]; then
        unzip "$FILE_NAME"
    else
        tar -zxf "$FILE_NAME"
    fi

    echo "$1 uncompressed successfully."
}

addToShell() {
    if [ -f ~/.bashrc ]; then
        echo "$1" >> ~/.bashrc &&
        . ~/.bashrc
    fi

    if [ -f ~/.zshrc ]; then
        echo "$1" >> ~/.zshrc &&
        . ~/.zshrc
    fi
}