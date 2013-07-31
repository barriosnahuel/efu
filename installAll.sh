#Script created by Nahuel Barrios: barrios.nahuel@gmail.com
#Just comment the undesired software at the: "sudo apt-get install" line to skip installing specific software.


##############################  Add particular software repositories    ##############################

#Add Google Chrome repositories
#Setup key
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
#Add repository
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Add repositories for the WebApps and Lens.
sudo add-apt-repository ppa:scopes-packagers/ppa

#Add repositories for LibreOffice.
sudo add-apt-repository ppa:libreoffice/ppa

#Add repositories for Skype.
sudo add-apt-repository ppa:upubuntu-com/chat

#Add repositories for JDownloader.
sudo add-apt-repository ppa:jd-team/jdownloader

#Add repositories for Sublime Text 2.
sudo add-apt-repository ppa:webupd8team/sublime-text-2

#Add repositories for RabbitVCS integration with Nautilus. Like TortoiseSVN.
sudo add-apt-repository ppa:rabbitvcs/ppa

#PROBAR CON ESTE COMENTADO, NO ME ACUERDO PARA CUAL ERA NECESARIO
#sudo add-apt-repository ppa:webapps/preview
#sudo add-apt-repository ppa:atareao/lenses

#Add repositories for Mixxx DJ software.
sudo add-apt-repository ppa:mixxx/mixxx


#Update software sources. Required after adding a ppa repository.
sudo apt-get update

#Remove packages that are not neccessary to prevent conflicts.
sudo apt-get autoremove


##############################  Install favorite software   ##############################

#Install the stable version of Google Chrome
sudo apt-get install google-chrome-stable

#Install OpenJDK plugin to run Java applets from browsers: Firefox, Chromium, Google Chrome, and Epiphany.
sudo apt-get install icedtea-7-plugin

#Install Skype.
sudo apt-get install skype skype-bin

#Install JDownloader.
sudo apt-get install jdownloader

#Install GMount ISO.
sudo apt-get install gmountiso

#####   Install Unity lens and web apps.
sudo apt-get install unity-lens-news
sudo apt-get install unity-lens-gdocs
sudo apt-get install unity-lens-photo

#Add the PirateBay scope for torrents lens. Required when installing torrents lens 'cuz if not then it throws an error. Try without
sudo apt-get install unity-scope-piratebay python-lxml
sudo apt-get install unity-lens-torrents

#Install Sublime Text 2 editor.
sudo apt-get install sublime-text-2-beta

#Install GitHub len (the following 2 lines)
sudo apt-get -t quantal-backports install python-unity-singlet
sudo apt-get install unity-lens-github

#ESTE ESTA FALLANDO POR: unity-webapps-preview : Depends: unity-webapps but it is not going to be installed
#sudo apt-get install unity-webapps-preview

sudo apt-get install unity-webapps-bbcnews
sudo apt-get install unity-webapps-facebookapps
sudo apt-get install unity-webapps-facebookmessenger
sudo apt-get install unity-webapps-gmail
sudo apt-get install unity-webapps-googleplus
sudo apt-get install unity-webapps-linkedin
sudo apt-get install unity-webapps-twitter
sudo apt-get install unity-webapps-youtube

#Notificaciones (entrar con Firefox/Chromium a):
#   No andan: Twitter, Calendar, Gmail, Google+, Linkedin, Facebook, 
#   Andan: bbc.co.uk/news


##############################  Install development software ##############################

#RabbitVCS integration with Nautilus. Like TortoiseSVN.
sudo apt-get install rabbitvcs-nautilus3

#Install Intellij IDEA (Community Edition).
#sudo apt-get install intellij-idea-ce

#Install Apache Maven for dependencies management.
sudo apt-get install maven

#####   Install required software to develop Ubuntu apps for mobile devices (this is for create the UI).
#Install Qt 5
sudo add-apt-repository ppa:canonical-qt5-edgers/qt5-beta1 && sudo apt-get update && sudo apt-get install qt5-meta-full && echo 'export PATH=/opt/qt5/bin:$PATH' >> ~/.bashrc

#Install Ubuntu QML Toolkit preview
sudo add-apt-repository ppa:ui-toolkit/ppa && sudo apt-get update && sudo apt-get install qt-components-ubuntu qt-components-ubuntu-demos qt-components-ubuntu-examples qt-components-ubuntu-doc notepad-qml

#install NPM for NODE JS coding.
sudo apt-get install npm

#Intall MonoDevelop to develop .NET applications.
sudo apt-get install monodevelop*


##############################  Install utility  software   ##############################

#Install Mixxx DJ software.
sudo apt-get install mixxx

#Install TEG client.
sudo apt-get install teg


##############################      Run final commands      ##############################

#Upgrade some applications like LibreOffice.
sudo apt-get dist-upgrade

#Remove packages that are not neccessary
sudo apt-get autoremove
