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

Sometimes there are too many roms to choose something new to play. So Ive created 2 scripts that will create randoms roms for you.
The first will create a copy of the the roms in the appropriate rom folder, the other will create a random collection of roms that you will be able to select from your Collections in EmulationStation.

### random-roms.sh

This script will copy random roms into the root of the emultor folder from the archive folder.
If you dont want random roms for this emulator, then dont create the archive folder

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

Copy autostart.sh and uncomment the call to random-roms.sh that the roms are copied before emulation station opens
```
#/opt/retropie/configs/all/random-collection.sh
/opt/retropie/configs/all/random-roms.sh
emulationstation #auto
```

Once copied use chmod to reset the permissions
```
chmod 755 autostart.sh
chmod 755 random-roms.sh
```

### random-collection.sh

This script will create random list of roms from all the roms folders and make a Collection.

Use the EmulationStation menu to enable collections and the _RANDOM_ collection list. Make sure to quit emulation station cleanly using the menu to save your settings. (Powering off will not save these changes)

To change the number of roms in the list, change this line
```
# number of random roms
files=35
```

Copy autostart.sh and uncomment the call to random-collection.sh so that the roms are copied before emulation station opens
```
/opt/retropie/configs/all/random-collection.sh
#/opt/retropie/configs/all/random-roms.sh
emulationstation #auto
```

Once copied use chmod to reset the permissions
```
chmod 755 autostart.sh
chmod 755 random-collection.sh
```
