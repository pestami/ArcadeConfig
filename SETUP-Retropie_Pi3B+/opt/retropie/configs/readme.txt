=================================
/opt/retropie/configs/arcade
#2024 03 01: 
1 - Copy these files to :
  \opt\retropie\configs
2 - Ensure marked as executable
/opt/retropie/configs/arcade
=================================
/opt/retropie/configs/arcade/&console&
emulators.cfg
contain start commands for emulators:
lr-fbneo = "/opt/retropie/emulators/retroarch/bin/retroarch -L /opt/retropie/libretrocores/lr-fbneo/fbneo_libretro.so --config /opt/retropie/configs/arcade/retroarch.cfg %ROM%"
