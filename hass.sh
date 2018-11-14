#!/bin/bash
#Made by SirBaeK 11/2018

HASSPATH="/opt/homeassistant"
HASSUSER="homeassistant"
sudo ./backuplog.sh



case "$1" in

  -p|python) #download python 3.5.3 required from homeassistant
	    echo "add repository,update apt and install python3(>3.5.3)"
            sudo add-apt-repository -y ppa:deadsnakes/ppa;
            sudo apt-get update;
            sudo apt-get install -y python3.6-venv python3.6-dev
	    echo "python3.6-venv + python3.6-dev installed"
            ;;

  -a|adduser) #add homeassistant user with HOME dir
            echo "add user homeassistant"
	    sudo useradd $HASSUSER -m -U -p $HASSUSER
	    echo "user homeassistant added"
            ;;

  -u|upgrade) #upgrade homeassistant - NOT TESTED
            echo "upgrading homeassistant"
	    sudo -u $HASSUSER -H sh -c "cd $HASSPATH; source $HASSPATH/bin/activate; python3.6 -m pip install --upgrade homeassistant; echo 'hass upgraded'"
	    ;;
  -c|clear) #clearing /opt/homeassistant and make new with correct rights, must be executed after add-user
	    echo "clearing /opt/homeassistant and make new with rights"
	    if [ -d $HASSPATH ]; then
 	      sudo rm -rf $HASSPATH;
  	      sudo mkdir $HASSPATH;
              sudo chown $HASSUSER:$HASSUSER $HASSPATH/
            fi
	    ;;
  -i|install) #download homeassistant + dependiencies required 
	    echo "Instalace homeassistant + dependiencies :D"
	    python3.6 -m pip install wheel
	    python3.6 -m pip install homeassistant
	    echo "hass instaled"
	    pip3 install home-assistant-frontend sqlalchemy aiohttp_cors PyQRCode pyotp warrant mutagen xmltodict netdisco distro
	    echo "pip modules updated"
	    ;;
  -s|start) #start home assistant from python virtual environment in /opt/homeassistant: my hardlinks, MUST BE EDITED
	    echo "Spoustim java virtual enviroment + hass"
	    sudo -u $HASSUSER -H sh -c "python3.6 -m venv $HASSPATH; echo 'venv set'; . $HASSPATH/bin/activate; echo 'venv activated'; $HASSPATH/bin/hass --open-ui --daemon -c /home/homeassistant/.homeassistant/ -v; echo 'hass started'"
	    sleep 5
	    sudo -u kafkicz -H sh -c "firefox -P default -new-window http://192.168.11.7:8123"
	    ;;
esac



echo "konec"

#################################################################################################
#					basicaly my steps					#
#					later wanna rewrite 					#
#################################################################################################
#sudo -u $HASSUSER -H -s									#
#cd $HASSPATH											#
#python3.6 -m venv $HASSPATH									#
#sleep 3											#
#. $HASSPATH/bin/activate
##sleep 1
#$HASSPATH/bin/hass --open-ui --daemon -c /home/homeassistant/.homeassistant/
#sleep 5
#su -u kafkicz -H -s
#if [ -d $HASSPATH ]; then
#  sudo rm -rf $HASSPATH/*
##else
#  sudo mkdir $HASSPATH;
#  sudo chown $HASSUSER:$HASSUSER $HASSPATH/
#fi


#python3.6 -m venv $HASSPATH


#if [ "$*" == "--python" ]; then 
#  sudo add-apt-repository -y ppa:deadsnakes/ppa;
#  sudo apt-get update;
#  sudo apt-get install -y python3.6-venv python3.6-dev
#fi


#if [ "$*" == "--adduser" ]; then 
#  sudo useradd $HASSUSER -m -U -p $HASSUSER
#fi

#if [ "$*" == "--upgrade" ]; then 
#  cd $HASSPATH;
#  source $HASSPATH/bin/activate;
#  python3.6 -m pip install --upgrade homeassistant
#fi


#sudo -u $HASSUSER -H -s

#python3.6 -m venv $HASSPATH
#. $HASSPATH/bin/activate
#python3.6 -m pip install wheel
#python3.6 -m pip install homeassistant

#pip3 install home-assistant-frontend sqlalchemy aiohttp_cors PyQRCode pyotp warrant mutagen xmltodict netdisco dis#tro
#$HASSPATH/bin/hass --open-ui --daemon
#sudo -u kafkicz -H -s












