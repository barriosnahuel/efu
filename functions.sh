#!/bin/sh

# Created by Nahuel Barrios on 15/04/15. Contact me at: Barrios.Nahuel@gmail.com

log() {
    echo $1 &&
    echo $1 >> efu.log
}

getFileName() {
    echo ${1##*/}
}

getFileExtension() {
    echo ${1##*.}
}

getDirectoryFromFileName() {
    echo ${1%.*}
}

##  Parameters:
# 1. URL
download() {
    curl -O $1
}

##  Parameters:
# 1. URL
downloadInBackground() {
    curl -O $1 &
}

##  Parameters:
# 1. Program name
# 2. URL
install() {
    echo "==> - EFU: Installing" $1 "..."
    FILE=$(getFileName $2)

    sudo dpkg -i $FILE &&
    echo $1 "installed successfully." &&

    rm -f $FILE
}

##  Parameters:
# 1. Program name
# 2. URL
downloadAndInstall() {
    download $2 &&
    install $1 $2
}

##  Parameters:
# 1. Program name
# 2. URL
downloadAndUncompress() {
    download $2 &&

    # Get file name from path or URL.
    FILE_NAME=$(getFileName $2) &&

    # Use the file extension to use unzip or tar to uncompress the file.
    if [ $(getFileExtension $FILE_NAME) = "zip" ]; then
        unzip $FILE_NAME
    else
        tar -zxf $FILE_NAME
    fi

    echo $1 "uncompressed successfully."
}
