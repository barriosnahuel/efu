#!/bin/bash
#	Script  created by
#	Nahuel Barrios barrios.nahuel@gmail.com
#	Last use: 07/08/2011
#
#	Installation notes:	
#		- Before running this shell script you have to: 
#			1.	Add the following line to your /etc/apt/sources.list
#				deb http://download.virtualbox.org/virtualbox/debian lucid contrib non-free
#		- While running this shell script you can run the following command into a terminal to see a dynamic installation log:
#			tail –f installationLog.txt

echo "Installing basic programs into your system."
echo > installationLog.txt
echo "--"
echo "Note: While running this shell script you can run the following"
echo "command into a terminal to see a dynamic installation log:"
echo "          tail –f installationLog.txt"

#	Verifico que se haya ingresado uno de los parametros, si no se ingreso nada, entonces salgo.
case "${1}" in
	true)
		;;
	false)
		;;
	*)
		echo "Invalid first parameter. Try: {true | false} to install development features."
		exit 1
		;;#	Permite el uso del USB en las VM.
#sudo adduser $(whoami) vboxusers
esac
case "${2}" in
	true)
		;;
	false)
		;;
	*)
		echo "Invalid second parameter. Try: {true | false} to install extra games and icons."
		exit 1
		;;
esac

#####################################
#	Begins with the installation.


#	Refresh the package repositories
sudo aptitude update && sudo aptitude safe-upgrade


echo "" >> installationLog.txt
echo ">     Adding new repositories..." >> installationLog.txt

#	Adds the jDownloaders repository to the list.
sudo add-apt-repository ppa:jd-team/jdownloader

#	Adds the osd-lyrics repository to the list.
sudo add-apt-repository ppa:osd-lyrics/ppa

#	Adds the Medibuntu software repository to the list.
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

#	This line is for adding Quantum GIS repository
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable

#	Finally udpates the repository
sudo apt-get update
sudo aptitude update

#	Starts with the software installation.

#	Codecs no libres.
echo "" >> installationLog.txt
echo ">     Installing non free codecs..." >> installationLog.txt
sudo aptitude -y install non-free-codecs#	Permite el uso del USB en las VM.

#	Reproducir DVDs.
echo "" >> installationLog.txt
echo ">     Installing play DVDs skill..." >> installationLog.txt
sudo aptitude -y install libdvdread4 && sudo /usr/share/doc/libdvdread4/install-css.sh

echo "" >> installationLog.txt
echo ">     Installing compress/uncompress .rar skill..." >> installationLog.txt
sudo apt-get install unrar

echo "" >> installationLog.txt
echo ">     Installing compress/uncompress .7z skill..." >> installationLog.txt
sudo apt-get install p7zip

echo "" >> installationLog.txt
echo ">     Installing SSH client and server..." >> installationLog.txt
sudo apt-get install ssh

echo "" >> installationLog.txt
echo ">     Installing Sun's Java Development Toolkit (JDK) and Java Runtime Environment (JRE)..." >> installationLog.txt
sudo apt-get install sun-java6-jdk sun-java6-fonts sun-java6-doc sun-java6-jre sun-java6-javadb

echo "" >> installationLog.txt
echo ">     Installing JDownloader..." >> installationLog.txt
sudo apt-get install jdownloader

echo "" >> installationLog.txt
echo ">     Installing Medibuntu software..." >> installationLog.txt
sudo apt-get --yes install app-install-data-medibuntu apport-hooks-medibuntu

echo "" >> installationLog.txt
echo ">     Installing Skype..." >> installationLog.txt
sudo apt-get install skype

echo "" >> installationLog.txt
echo ">     Installing FileZilla..." >> installationLog.txt
sudo apt-get install filezilla

echo "" >> installationLog.txt
echo ">     Installing OSD-Lyrics..." >> installationLog.txt
sudo apt-get install osdlyrics

echo "" >> installationLog.txt
echo ">     Installing extra audio codecs..." >> installationLog.txt
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install non-free-codecs
sudo apt-get install w64codecs

echo "" >> installationLog.txt
echo ">     Installing aMule (the linux version of eMule)" >> installationLog.txt
sudo apt-get install amule

echo "" >> installationLog.txt
echo ">     Installing Wine..." >> installationLog.txt
sudo apt-get install wine

echo "" >> installationLog.txt
echo ">     Installing Dia (Diagram editor, it can open .vsd files)..." >> installationLog.txt
sudo apt-get install dia

echo "" >> installationLog.txt
echo ">     Installing Audacity (An audio editor)..." >> installationLog.txt
sudo apt-get install audacity

#	Permite el uso del USB en las VM. (Requiere tener instalado VirtualBox)
sudo adduser $(whoami) vboxusers


case "${1}" in
	true)
		#	Install development features
		echo "" >> installationLog.txt
		echo "     Now we'll start to install development software     " >> installationLog.txt

		echo "" >> installationLog.txt
		echo ">     Intalling Apache Tomcat 6..." >> installationLog.txt
		sudo apt-get install tomcat6

		echo "" >> installationLog.txt
		echo ">     Installing Subversion..." >> installationLog.txt
		sudo apt-get install subversion

		echo "" >> installationLog.txt
		echo ">     Installing QGit control version system..." >> installationLog.txt
		sudo apt-get install qgit

		echo "" >> installationLog.txt
		echo ">     Installing OpenSSL library..." >> installationLog.txt
		sudo apt-get install libssl-dev

		echo "" >> installationLog.txt
		echo ">     Intalling Eclipse IDE..." >> installationLog.txt
		sudo apt-get install eclipse eclipse-plugin-cvs eclipse-jdt eclipse-pde eclipse-xsd-sdk eclipse-xsd eclipse-platform-data eclipse-cdt eclipse-rcp eclipse-rse

		echo "" >> installationLog.txt
		echo ">     Intalling Netbeans IDE..." >> installationLog.txt
		sudo apt-get install netbeans

		echo "" >> installationLog.txt
		echo ">     Intalling Wireshark packet sniffer..." >> installationLog.txt
		sudo apt-get install wireshark

		echo "" >> installationLog.txt
		echo ">     Intalling MySQL..." >> installationLog.txt
		sudo apt-get install mysql-client

		echo "" >> installationLog.txt
		echo ">     Installing Maven2..." >> installationLog.txt
		sudo apt-get install maven2

		echo "" >> installationLog.txt
		echo ">     Installing Quantum GIS..." >> installationLog.txt
		sudo apt-get install qgis

		;;
	false)
		;;
	*)
		echo "Invalid first parameter. Try: {true | false}."
esac

case "${2}" in
	true)
		###################################################
		#	These lines are for installing extra games.
		echo ">     Installing extra games..." >> installationLog.txt

		echo "" >> installationLog.txt
		echo ">     Installing PokerTH..." >> installationLog.txt
		sudo apt-get install pokerth

		echo "" >> installationLog.txt
		echo ">     Installing T.E.G...." >> installationLog.txt
		sudo apt-get install teg

		echo "" >> installationLog.txt
		echo ">     Installing SuperTuxKart...." >> installationLog.txt
		sudo apt-get install supertuxkart

		###################################################
		#	These lines are for installing extra icons. 
		echo ">     Installing extra icons in /home/{user}/.icons..." >> installationLog.txt
		cd ~/.icons
		#	The first package
		wget http://nuovext.pwsp.net/files/nuoveXT-1.6.tar.gz
		tar -zxvf nuoveXT-1.6.tar.gz
		rm nuoveXT-1.6.tar.gz

		#	The second package
		wget http://art.gnome.org/download/themes/icon/1008/ICON-Kreski-Lines.tar.gz
		tar -zxvf ICON-Kreski-Lines.tar.gz
		rm ICON-Kreski-Lines.tar.gz
		;;
	false)
		;;
	*)
		echo "Invalid second parameter. Try: {true | false}."
esac




#	Bye bye message.
echo ">>>>>>>>>>     All changes applied, thanks!"
echo ">>>>>>>>>>     See installationLog.txt file to check log."
echo ">>>>>>>>>>     Creted by Nahuel Barrios, 2010."

