#!/bin/bash 
echo =====================================================
echo MULTIMEDIA Folders: Film Photo Books Music
echo =====================================================
echo ========VERSIONS 2023/03/09===========================
echo 2023/05/19 Created
echo 2023/05/19 Modified
echo 2023/11/29 Modified
echo 
echo =====================================================
#----------- List Block Devices ----------- 
# list usb devices
# lsusb
# list all bulk devices , all availabe in dev directory
echo =====================================================
echo List block devices:
sudo lsblk --f | grep sd 
#=========================================================
#sudo mount /media/usb1 /home/$USER/RetroPie/roms
# /media/usb1 is not a block device.
echo =====================================================
echo Mount block devices:
echo =====================================================
echo LABEL=INTENSO 
echo =====================================================
echo =====================================================
echo MEDIA_DEVICE USEID GROUPID

MEDIA_DEVICE=$(findfs LABEL=INTENSO)
echo $MEDIA_DEVICE
USERID=$(id -g $USER)
echo $USERID
GROUPID=$(id -g $USERID)
echo $GROUPID

echo =====================================================
echo MAKE FOLDERS
mkdir /home/$USER/INTENSO
# mkdir /home/$USER/INTENSO/Film
# mkdir /home/$USER/INTENSO/Photo
# mkdir /home/$USER/INTENSO/Music
# mkdir /home/$USER/INTENSO/Books
echo =====================================================
echo Mount Folders
# sudo mount $MEDIA_DEVICE /home/$USER/INTENSO
sudo mount -t vfat $MEDIA_DEVICE /home/$USER/INTENSO -o rw,uid=$USERID,gid=$GROUPID

echo -----------------------------------------------------
#---note spelling of RetroPie varies

sudo mount -o bind /home/$USER/INTENSO/BOXEE  /home/$USER/Videos
sudo mount -o bind /home/$USER/INTENSO/000_PHOTO /home/$USER/Pictures
sudo mount -o bind /home/$USER/INTENSO/002_MUSIC /home/$USER/Music
sudo mount -o bind /home/$USER/INTENSO/001_BOOKS /home/$USER/Documents
echo -----------------------------------------------------

echo =====================================================
echo Mutimedia
echo =====================================================
echo List mount point roms:
echo =Videos===============/home/$USER/Videos==============================
ls /home/$USER/Videos
echo =Pictures=============/home/$USER/Pictures============================
ls /home/$USER/Pictures
echo =Music================/home/$USER/Music===============================
ls /home/$USER/Music
echo =Documents============/home/$USER/Documents===========================
ls /home/$USER/Documents
echo =ROMS=================/home/pi/RetroPie/roms/===============================
echo =Not managed(mapped) by this script
ls /home/pi/RetroPie/roms/
echo =====================================================
#=========================================================
# Do not close window
read -p "Press any key to continue" x
$SHELL
