# This script needs to be run on
# KALI LINUX (Url: https://www.offensive-security.com/kali-linux-arm-images/ )

echo
echo "###############################"
echo "#      BASIC PREPARATIONS     #"
echo "###############################"
echo

read -p "Change root password? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) passwd;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Change hostname? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) read -p "Replace 'kali' with the desired hostname in the following 2 files" key;
	nano /etc/hostname;
	nano /etc/hosts;
	echo "DONE (Don't forget to reboot for the changes to take effect.)";
	echo;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Set default timezone? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) dpkg-reconfigure tzdata;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Move RasPOC folder into home dir? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) mv raspoc ~;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Configure RasPOC specific cronjobs? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) read -p "Paste the following lines into crontab file (change script locations if needed):" key;
	echo
	echo "#Start scanning as soon as the system boots up"
	echo "@reboot sh ~/raspoc/scan.sh"
	echo
	echo "#Filter logs every hour"
	echo "0 * * * * sh ~/raspoc/filter.sh"
	echo	
	echo "#Restart the system every Monday to fix hangups"	
	echo "0 0 * * 1 sh ~/raspoc/reboot.sh"
	echo	
	read -p "Press any key to continue" key;
	crontab -e
	echo "DONE (Don't forget to reboot for the changes to take effect.)";
	echo;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Update system? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) apt update && apt dist-upgrade -y && apt autoremove -y;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

echo
echo "###############################"
echo "#   INSTALL COMMON SOFTWARE   #"
echo "###############################"
echo

echo "Installing TightVNC Server"
apt install -y tightvncserver
echo

echo "Installing kali 'SDR' metapackage"
apt install -y kali-linux-sdr
echo

echo "Installing kali 'WIRELESS' metapackage" 
apt install -y kali-linux-wireless
echo

echo "Installing kali 'TOP 10' metapackage" 
apt install -y kali-linux-top10
echo

echo "Installing multimon-ng"
apt install -y multimon-ng
echo

echo "DONE!"
echo
