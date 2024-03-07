!/bin/bash 

echo ========VERSIONS 2023/03/09===========================
echo 2023/03/09 
echo 2023/03/17 - installed onMintPC corrected errors 
echo 2024/01/04 - games artwork.gameslists.collections only on USB deive 
#=========================================================
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'
#=========================================================
echo =====================================================
echo List block devices:
sudo lsblk --f | grep sd 

#=========================================================
echo =====================================================
echo Mount block devices:
echo =====================================================
echo =====================================================
echo GAMES RETROPIE 
echo =====================================================
echo =====================================================
echo MEDIA_DEVICE USEID GROUPID
MEDIA_DEVICE=$(findfs LABEL=INTENSO)
echo $MEDIA_DEVICE
echo =====================================================
echo ROM_DEVICE USEID GROUPID
ROM_DEVICE=$(findfs LABEL=ROM_EXTRA)
echo $ROM_DEVICE
echo =====================================================

USERID=$(id -g $USER)
echo $USERID
GROUPID=$(id -g $USERID)
echo $GROUPID

echo =====================================================

echo -----------------------------------------------------
mkdir /home/$USER/ROMS_EXTRA
#sudo mount $ROM_DEVICE /home/$USER/ROMS_EXTRA
echo -----------------------------------------------------

# sudo mount $MEDIA_DEVICE /home/$USER/INTENSO
sudo mount -t vfat $ROM_DEVICE /home/$USER/ROMS_EXTRA -o rw,uid=$USERID,gid=$GROUPID

#=========================================================
#for rom_folder in n64 arcade nds dreamcast c64 mame-libretro zxspectrum psx gc
#atari2600 atari5200 atari7800 arcade mame-libretro mame-mame4all neogeo 
#mastersystems megadrive sg-1000 nes snes gba gc ports 
#TurboGrafX c64.zxspectrum psp psx n64 nds
#=========================================================
for rom_folder in atari2600 atari5200 atari7800 arcade mame-libretro mame-mame4all neogeo mastersystems megadrive sg-1000 nes snes gba gc ports c64 zxspectrum psx nds
do 
	echo $rom_folder
	
	echo --------------------------------------------------------------------
	echo ----Mounting ROMS $rom_folder --------------------------------------
	mkdir /home/$USER/RetroPie/roms/$rom_folder
	sudo umount /home/$USER/RetroPie/roms/$rom_folder
	sudo mount -o bind /home/$USER/ROMS_EXTRA/roms/$rom_folder /home/$USER/RetroPie/roms/$rom_folder
	
	echo --------------------------------------------------------------------
	echo ----Mounting images $rom_folder ------------------------------------
	mkdir /home/$USER/ROMS_EXTRA/downloaded_images
	mkdir /opt/retropie/configs/all/emulationstation/downloaded_images
	mkdir /opt/retropie/configs/all/emulationstation/downloaded_images/$rom_folder
	sudo umount /opt/retropie/configs/all/emulationstation/downloaded_images/$rom_folder
	sudo mount -o bind /home/$USER/ROMS_EXTRA/downloaded_images/$rom_folder /opt/retropie/configs/all/emulationstation/downloaded_images/$rom_folder
	echo --------------------------------------------------------------------
	echo ----Mounting gamelists $rom_folder ---------------------------------
	mkdir /media/$USER/ROM_EXTRA/gameslists/$rom_folder
	mkdir /home/$USER/.emulationstation/gamelists/$rom_folder
	sudo umount /opt/retropie/configs/all/emulationstation/gamelists/$rom_folder
	sudo mount -o bind /home/$USER/ROMS_EXTRA/gameslists/$rom_folder /opt/retropie/configs/all/emulationstation/gamelists/$rom_folder
	echo ---------------------------------------------------------------------
done
#=========================================================
echo =====================================================
	echo --------------------------------------------------------------------
	echo ----Mounting collections $rom_folder ------------------------------------
sudo mount -o bind /home/$USER/ROMS_EXTRA/collections /opt/retropie/configs/all/emulationstation/collections
	echo --------------------------------------------------------------------
	echo ----Mounting BIOS $rom_folder ------------------------------------
sudo mount -o bind /home/$USER/ROMS_EXTRA/BIOS /home/pi/RetroPie/BIOS
echo =====================================================
echo =====================================================
echo GAMES RETROPIE
echo =====================================================
echo List mount point roms:
ls /home/$USER/RetroPie/roms
echo =====================================================
echo List mount point images:
ls /opt/retropie/configs/all/emulationstation/downloaded_images
echo =====================================================
echo List mount point Collections:
ls /opt/retropie/configs/all/emulationstation/collections
echo =====================================================
echo List mount point gamelists:
ls /home/$USER/.emulationstation/gamelists
echo =====================================================
echo =====================================================
#=========================================================
#$SHELL
