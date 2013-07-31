#Script created by Nahuel Barrios: barrios.nahuel@gmail.com
#Just comment the undesired software at the: "sudo apt-get install" line to skip installing specific software.


##############################  Add particular software repositories    ##############################
#Add repositories for the WebApps and Lens.
sudo add-apt-repository ppa:scopes-packagers/ppa

sudo add-apt-repository ppa:scopes-packagers/ppas

#Add repositories for LibreOffice.
sudo add-apt-repository ppa:libreoffice/ppa

#Add repositories for Skype.
sudo add-apt-repository ppa:upubuntu-com/chat

#Add repositories for JDownloader.
sudo add-apt-repository ppa:jd-team/jdownloader

#Add repositories for Sublime Text 2.
sudo add-apt-repository ppa:webupd8team/sublime-text-2

#PROBAR CON ESTE COMENTADO, NO ME ACUERDO PARA CUAL ERA NECESARIO
#sudo add-apt-repository ppa:webapps/preview
#sudo add-apt-repository ppa:atareao/lenses

#Add repositories for Mixxx DJ software.
sudo add-apt-repository ppa:mixxx/mixxx

#Update software sources. Required after adding a ppa repository.
sudo apt-get update

#Remove packages that are not neccessary to prevent conflicts.
sudo apt-get autoremove

#Upgrade some applications like LibreOffice.
sudo apt-get dist-upgrade


##############################  Install favorite software   ##############################
#Install the stable version of Google Chrome
sudo apt-get install google-chrome-stable

#Install OpenJDK plugin to run Java applets from browsers: Firefox, Chromium, Google Chrome, and Epiphany.
sudo apt-get install icedtea-7-plugin

#Install Skype.
sudo apt-get install skype

#Install PlayOnLinux with Wine to enable user run Windows programs.
sudo apt-get install playonlinux

#Install GMount ISO
sudo apt-get install gmountiso

#Install JDownloader.
sudo apt-get install jdownloader

#####   Install Unity lens and web apps.
sudo apt-get install unity-lens-news

#Add the PirateBay scope for torrents lens. Required when installing torrents lens 'cuz if not then it throws an error. Try without 
sudo apt-get install unity-scope-piratebay python-lxml
sudo apt-get install unity-lens-torrents

#Install Sublime Text 2 editor.
sudo apt-get install sublime-text-2-beta

#Remove packages that are not neccessary
sudo apt-get autoremove
