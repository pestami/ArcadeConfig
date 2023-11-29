#!/bin/bash 
echo =====================================================
echo GAMES RETROPIE 
echo =====================================================
echo ========VERSIONS 2023/03/09===========================
echo 2023/03/09 
echo 2023/03/17 - installed onMintPC corrected errors 
echo 2023/05/18 - changed name to ROM_MOUNT_FOLDER for mapped folder
echo =====================================================
# make file executable chmod +x runme.sh
# sudo crontab -e
# @reboot /home/rip/Desktop/SCRIPTS/mount_roms_films_books_music.sh
# grep CRON /var/log/syslog
#=========================================================
#----------- Convert PNG to JPG ----------- 
# parallel convert '{}' '{.}.jpg' ::: *.png

#----------- Convert JPG to PNG -----------
# parallel convert '{}' '{.}.png' ::: *.jpg
# rm *.png
#----------- List Block Devices ----------- 
# list usb devices
# lsusb
# list all bulk devices , all availabe in dev directory
echo =====================================================
echo List block devices:

sudo lsblk --f | grep sd 

#sda      8:0    0 223.6G  0 disk 
#├─sda1   8:1    0   512M  0 part /boot/efi
#└─sda2   8:2    0 223.1G  0 part /
#sdb      8:16   0   3.7T  0 disk 
#└─sdb1   8:17   0   3.7T  0 part /media/usb2
#sdc      8:32   0 465.8G  0 disk 
#└─sdc1   8:33   0 465.8G  0 part /media/usb0
#sdd      8:48   1 117.2G  0 disk 
#└─sdd1   8:49   1 117.2G  0 part /media/usb1
#=========================================================
#sudo mount /media/usb1 /home/$USER/RetroPie/roms
# /media/usb1 is not a block device.
echo =====================================================
echo Mount block devices:
echo =====================================================

echo LABEL=ROM_MOUNT 110 GB LABEL=ART_MOUNT 14 GB  
echo SCRIPT_MOUNT 4GB
echo =====================================================
echo =====================================================
ROM_DEVICE=$(findfs LABEL=ROM_MOUNT)
echo $ROM_DEVICE
echo =====================================================
echo MAKE FOLDERS
mkdir /home/$USER/ROM_MOUNT_FOLDER
mkdir /home/$USER/ROM_MOUNT_FOLDER/downloaded_images
mkdir /home/$USER/ROM_MOUNT_FOLDER/downloaded_media
mkdir /home/$USER/ROM_MOUNT_FOLDER/roms
mkdir /home/$USER/ROM_MOUNT_FOLDER/gamelists_images
mkdir /home/$USER/ROM_MOUNT_FOLDER/collections

mkdir /opt/retropie/configs/all/emulationstation/downloaded_images
mkdir /opt/retropie/configs/all/emulationstation/downloaded_media

echo =====================================================
echo Mount Folders
sudo mount $ROM_DEVICE /home/$USER/ROM_MOUNT_FOLDER
echo -----------------------------------------------------

#---note spelling of RetroPie varies
sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/collections /opt/retropie/configs/all/emulationstation/collections
sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/downloaded_images /opt/retropie/configs/all/emulationstation/downloaded_images
sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/downloaded_media /opt/retropie/configs/all/emulationstation/downloaded_media
sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/roms /home/$USER/RetroPie/roms

echo -----------------------------------------------------
# Prompt 
# read -p "Use Image gamelist or Media Gamelist: I or M " answer

answer="I"

if [ $answer == "M" ]; then
    sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/gamelists_media /home/$USER/.emulationstation/gamelists
     echo "Artwork in gameslists.xml folder is mapped to: gamelists_media "
elif [ $answer == "I" ]; then
	sudo mount -o bind /home/$USER/ROM_MOUNT_FOLDER/gamelists_images /home/$USER/.emulationstation/gamelists
    echo "Artwork in gameslists.xml folder is mapped to: gamelists_images "
else
  echo "The default gameslists.xml will be used "
fi

echo -----------------------------------------------------
echo -----------------------------------------------------
echo =====================================================
echo =====================================================
echo =====================================================
echo GAMES RETROPIE
echo =====================================================
echo List mount point roms:
ls /home/$USER/RetroPie/roms
echo =====================================================
echo List mount point images:
ls /opt/retropie/configs/all/emulationstation/downloaded_images
ls /opt/retropie/configs/all/emulationstation/downloaded_media
echo =====================================================
echo List mount point Collections:
ls /opt/retropie/configs/all/emulationstation/collections
echo =====================================================
echo List mount point gamelists:
ls /home/$USER/.emulationstation/gamelists
echo =====================================================
echo =====================================================
#=========================================================
$SHELL
