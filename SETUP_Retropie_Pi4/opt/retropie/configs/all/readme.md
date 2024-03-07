---------------  
#2024 03 01: 
---------------  

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

> \opt\retropie\configs\all

Ensure marked as executable !

 atari2600 atari5200 atari7800 arcade mame-libretro mame-mame4all neogeo  
 mastersystems megadrive sg-1000 nes snes gba gc ports pc c64 pcengine zxspectrum   
 ***psp*** ***n64*** psx nds  

psp and n64 emulation is not recomended for Pi3.

This scripts will ensure that the USB is mapped to the
folders on retropie.