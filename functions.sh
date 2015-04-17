#!/bin/sh
# Created by Nahuel Barrios on 15/04/15. Contact me at: Barrios.Nahuel@gmail.com

getFileName(){
    echo ${1##*/}
}

getDirectoryFromFileName(){
    echo ${1%.*}
}

download (){
    curl -O $1
}

downloadInBackground (){
    curl -O $1 &
}

install (){
    echo "==> - EFU: Installing" $1 "..."
    FILE=$(getFileName $2)

    sudo dpkg -i $FILE &&
    echo $1 "installed successfully" &&

    rm -f $FILE
}

downloadAndInstall (){
    download $1 &&
    install $1 $2
}

