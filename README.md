# my-retropie

Some files from my retropie

**Use at own risk**

## Contents

+ Splashscreens
+ ROM randomizer

## Splashscreens

Use the Splash screen randomizer in rpsetup to randomise through splashscreens

+ Amiga_01.png
+ Amiga_02.png
+ c64_01.png
+ vic20_01.png

## ROM randomiser

### random.sh

Sometimes there are too many roms to choose something new to play.
This script will copy random roms into the root of the emultor folder from the archive folder.
If you dont want random roms then dont create teh archive folder

Folder strcuture:
```
/home/pi/RetroPie/roms/
  amiga/         (random roms copied here)
    archive/     (roms go here)
  nes/
    archive/
```

To change the number of roms it copies change this line
```
# number of random files of each emuulator
files=5
```

Copy autostart.sh to so that the roms are copied before emulation station opens

Once copied use chmod to reset the permissions
```
chmod 755 autostart.sh
chmod 755 random.sh
```