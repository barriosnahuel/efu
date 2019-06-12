#!/bin/sh
# Created by Nahuel Barrios on 15/04/15.
# shellcheck disable=SC1090

logError () {
    echo "ERROR - EFU: $1 $2 $3"
    echo "ERROR - EFU: $1 $2 $3" >> ~/Downloads/efu.log
    echo "ERROR - EFU: $1 $2 $3" >> ~/Downloads/summary.efu.log
}

logWarn () {
    echo "WARN  - EFU: $1 $2 $3"
    echo "WARN  - EFU: $1 $2 $3" >> ~/Downloads/efu.log
    echo "WARN  - EFU: $1 $2 $3" >> ~/Downloads/summary.efu.log
}

logInfo (){
    echo "INFO  - EFU: $1 $2 $3"
    echo "INFO  - EFU: $1 $2 $3" >> ~/Downloads/efu.log
}

logSummary (){
    echo "INFO  - EFU: $1 $2 $3"
    echo "INFO  - EFU: $1 $2 $3" >> ~/Downloads/summary.efu.log
}

logAlreadyInstalled (){
    logWarn "'$1' already installed. Skipping installation..."
}

logProgramVersion (){
    logInfo "$1" "$2" "$3"
    logSummary "Installed $1 $2 $3" >> ~/Downloads/summary.efu.log
}

preInstallationLog(){
    logInfo "Installing $1..."
}

postInstallationLog(){
    logSummary "$1 installed ok"
}

isUbuntu(){
    if [ "$1" = "ubuntu" ]; then
        return 0
    else
        return 1
    fi
}

isLubuntu(){
    if [ "$1" = "lubuntu" ]; then
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

    uncompress "$FILE_NAME"
}

##  Parameters:
# 1. File name (without path).
uncompress(){
    logInfo "Uncompressing $1"

    # Use the file extension to use unzip or tar to uncompress the file.
    if [ "$(getFileExtension "$1")" = "zip" ]; then
        unzip "$1"
    else
        tar -zxf "$1"
    fi

    logInfo "$1 uncompressed successfully."
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

##  Parameters:
# 1. String w/ format: "repoOwner/repoName"
getGitHubFirstAssetFromLatestRelease(){
    curl -s https://api.github.com/repos/"$1"/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4
}

##  Parameters:
# 1. Url to the browser download url.
downloadAssetFromGitHub(){
    curl -LOk "$1"
}

enterDirOrExit(){
    if ! cd "$1"; then
        echo "Failed cding into $1, exiting..."
        exit 1
    fi
}