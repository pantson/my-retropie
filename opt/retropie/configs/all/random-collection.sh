#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# number of random roms
files=30

# extensions
extensions="zip,dsk,lha,a26,lnx,iso,cue,gbc,dsk,md,gen,chd,mcm,smd,gba,a78,nes,n64"

# roms dir
roms=/home/pi/RetroPie/roms

# collection
collection=/opt/retropie/configs/all/emulationstation/collections/custom-_RANDOM_.cfg
echo "">"$collection"

cd $roms
extensions=${extensions//\,/\\\|}

echo "Random ROM collection...."
for f in $(find $roms -regex ".*\.\($extensions\)"|shuf -n $files); do
  file=$(echo $f | rev | cut -d'/' -f1 | rev)
  echo "$file"
  echo "$f">>"$collection"
done
echo "-------------"

# restore $IFS
IFS=$SAVEIFS
