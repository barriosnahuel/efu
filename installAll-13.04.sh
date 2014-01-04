#!/bin/bash
#   Script created by Nahuel Barrios: barrios.nahuel@gmail.com
#   Just comment the undesired software at the: "sudo apt-get install" line to skip installing specific software.


##############################  Add particular software repositories    ##############################

#Add Oracle JDK repository
sudo add-apt-repository ppa:webupd8team/java

#Add repositories for the WebApps and Lens.
sudo add-apt-repository ppa:scopes-packagers/ppa

#Add repositories for Grive (a Google Drive unofficial client)
sudo apt-add-repository ppa:thefanclub/grive-tools

#Add repositories for Skype.
sudo add-apt-repository ppa:upubuntu-com/chat

#Add repositories for JDownloader.
sudo add-apt-repository ppa:jd-team/jdownloader

#Add repositories for Sublime Text 3.
sudo add-apt-repository ppa:webupd8team/sublime-text-3

#Add repositories and dependencies for NodeJS.
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js

#Add repositories for RabbitVCS integration with Nautilus. Like TortoiseSVN.
sudo add-apt-repository ppa:rabbitvcs/ppa

#Add repositories for Mixxx DJ software.
sudo add-apt-repository ppa:mixxx/mixxx

#Update software sources. Required after adding a ppa repository.
sudo apt-get update

#Remove packages that are not neccessary to prevent conflicts.
sudo apt-get autoremove


##############################  Install favorite software   ##############################


#Install dependencies to rar/unrar files.
sudo apt-get install unrar rar

#Install Java JDK and set as default.
sudo apt-get install oracle-jdk7-installer oracle-java7-set-default

#Install FreeMind to make and view mind maps.
sudo apt-get install freemind

#Install a Google Drive unofficial client
sudo apt-get install -y grive-tools

#Install Skype.
sudo apt-get install skype skype-bin

#Install JDownloader.
sudo apt-get install jdownloader

#Install GMount ISO.
sudo apt-get install gmountiso

#Add the PirateBay scope for torrents lens. Required when installing torrents lens 'cuz if not then it throws an error. Try without
sudo apt-get install unity-scope-piratebay python-lxml

#Install Sublime Text 3 editor (beta).
sudo apt-get install sublime-text-installer

#Install Wine to run some Windows programs
sudo apt-get install wine

#Install GIMP images editor
sudo apt-get install gimp


##############################  Install development software ##############################

#Install GIT
sudo apt-get install git-core

#Install Apache Maven for dependencies management.
sudo apt-get install maven

#RabbitVCS integration with Nautilus. Like TortoiseSVN.
sudo apt-get install rabbitvcs-nautilus3

#Install Intellij IDEA (Community Edition).
#sudo apt-get install intellij-idea-ce

#####   Install required software to develop Ubuntu apps for mobile devices (this is for create the UI).
#Install Qt 5
sudo add-apt-repository ppa:canonical-qt5-edgers/qt5-beta1 && sudo apt-get update && sudo apt-get install qt5-meta-full && echo 'export PATH=/opt/qt5/bin:$PATH' >> ~/.bashrc

#Install Ubuntu QML Toolkit preview
sudo add-apt-repository ppa:ui-toolkit/ppa && sudo apt-get update && sudo apt-get install qt-components-ubuntu qt-components-ubuntu-demos qt-components-ubuntu-examples qt-components-ubuntu-doc notepad-qml

#Install NodeJS and NPM
#   It installs current stable Node on the current stable Ubuntu. Quantal (12.10) users may need to install the
#   software-properties-common package for the add-apt-repository command to work: sudo apt-get install software-properties-common
#   As of Node.js v0.10.0, the nodejs package from Chris Lea's repo includes both npm and nodejs-dev.
sudo apt-get install nodejs

#Install PhoneGap
sudo npm install -g phonegap

#Install Apache Cordova (required for PhoneGap)
sudo npm install -g cordova

#Install Plugman, a command line tool to install and uninstall plugins for use with Apache Cordova projects. (https://github.com/apache/cordova-plugman)
sudo npm install -g plugman

#Install lastest(?) version of Ruby.
sudo apt-get install ruby1.9.3

#Install RubyGems, a package management application for Ruby that is used to quickly and easily distribute Ruby/Rails applications and libraries.
sudo apt-get install rubygems

#Install MongoDB
sudo apt-get install mongodb

#Intall MonoDevelop to develop .NET applications.
sudo apt-get install monodevelop*


##############################  Install utility  software   ##############################

#Install Mixxx DJ software.
sudo apt-get install mixxx

#Install TEG client.
sudo apt-get install teg


##############################      Run final commands      ##############################

#Remove packages that are not neccessary
sudo apt-get autoremove
