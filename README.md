# ArcadeConfig  

Collection of scripts and config files for arcade  

## USB Game Drive  
The USB drive must have a Label set to:

>  ROM_EXTRA

It must contain the folders:  

- BIOS  
- collections  
- downloaded_images  
- gameslists  
- roms

The contents of these folders are identical to  
the corresponding folders in the retropie folders:  

- /home/pi/RetroPie/BIOS  
- /opt/retropie/configs/all/emulationstation/collections  
- /opt/retropie/configs/all/emulationstation/downloaded_images  
- /home/$USER/.emulationstation/gamelists  
- /home/$USER/RetroPie/roms  

## Map USB Game Drive

Add these files:  

- autostart.sh  
- mount_roms_extra_gamelists_artwork.sh  

 to the direcory below.  

> \opt\retropie\configs

This scripts will ensure that the USB is mapped to the
folders on retropie.

## Game Collections  

 * custom-Golden80s.cfg  
 * custom-Hits 70s.cfg  
 * custom-Hits 80s Cloned.cfg  
 * custom-Hits 80s Original.cfg  
 * custom-LightGun.cfg  
 * custom-Mario.cfg  
 * custom-N64DEMO.cfg  
 * custom-Pinball.cfg  
 * custom-Players Two.cfg  
 * custom-SYSTEMTEST-ARCADE.cfg  
 * custom-SYSTEMTEST-GAMEPAD.cfg  
 * custom-SYSTEMTEST-KEYBOARD.cfg  
 * custom-Tanks.cfg  

Add these collections to directory:  

> \home\pi\emulationstation\collections


## MAME System Logo displayed Correctly

Add these files to the direcory below.

 es_systems.cfg


>  \etc\emulationstation\themes

## PIXEL Desktop

After the PIXEL desktop has been instaled the following  
are recomended applications:  

### qjoypad:
sudo apt-get update -y  
sudo apt-get install -y qjoypad  

### jstest:
sudo apt-get install jstest-gtk  


### Rotate Monitor:
sudo nano /boot/config.txt

Add one of the following lines to the bottom of the file :

display_rotate=0

display_rotate=1

display_rotate=2

display_rotate=3

0 is the normal configuration. 1 is 90 degrees. 2 is 180 degress. 3 is 270 degrees.




