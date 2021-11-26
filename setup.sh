# This script needs to be run on
# KALI linux (URL: https://www.kali.org/get-kali/#kali-arm )

echo
echo "###############################"
echo "#      BASIC PREPARATIONS     #"
echo "###############################"
echo

read -p "Change default password? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) passwd;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Change hostname? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) read -p "Replace 'kali' with the desired hostname in the following 2 files" key;
	sudo nano /etc/hostname;
	sudo nano /etc/hosts;
	echo "DONE (Don't forget to reboot for the changes to take effect.)";
	echo;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Set default timezone? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) sudo dpkg-reconfigure tzdata;;
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
	sudo crontab -e
	echo "DONE (Don't forget to reboot for the changes to take effect.)";
	echo;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

read -p "Update system? Continue (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y;;
  n|N ) echo "canceling...";;
  * ) 	echo "invalid input";;
esac
echo

echo
echo "###############################"
echo "#   INSTALL COMMON SOFTWARE   #"
echo "###############################"
echo

echo "Installing kali 'SDR' metapackage"
sudo apt install -y kali-tools-sdr 
echo

echo "DONE!"
echo
