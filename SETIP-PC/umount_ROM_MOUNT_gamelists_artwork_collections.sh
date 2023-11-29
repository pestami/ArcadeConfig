#!/bin/bash 

echo ========VERSIONS 2023/03/09===========================
echo 2023/03/09 
echo 2023/03/17 - installed onMintPC corrected errors 

echo =====================================================
echo uMount block devices:
echo =====================================================
echo =====================================================
echo GAMES RETROPIE 
echo =====================================================
echo =====================================================
echo =====================================================
sudo umount /home/$USER/ROM_MOUNT_FOLDER
echo -----------------------------------------------------

#---note spelling of RetroPie varies
sudo umount  /opt/retropie/configs/all/emulationstation/collections
sudo umount  /opt/retropie/configs/all/emulationstation/downloaded_images
sudo umount  /opt/retropie/configs/all/emulationstation/downloaded_media
sudo umount  /home/$USER/RetroPie/roms
sudo umount  /home/$USER/.emulationstation/gamelists


echo =====================================================
echo GAMES RETROPIE
echo =====================================================
echo List mount point roms:
ls /home/$USER/RetroPie/roms
echo =====================================================
echo List mount point images:
ls /opt/retropie/configs/all/emulationstation/downloaded_images
echo =====================================================
echo List mount point gamelists:
ls /opt/retropie/configs/all/emulationstation/gamelists
echo =====================================================
echo =====================================================
#=========================================================
$SHELL
