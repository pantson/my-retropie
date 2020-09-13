#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# number of random roms 
files=10

# extensions
extensions="zip,dsk,lha,a26,lnx,iso,cue,gbc,dsk,md,gen,chd,mcm,md,gba,a78,nes,n64"

# roms dir
roms=/home/pi/RetroPie/roms

# collection
collection=/opt/retropie/configs/all/emulationstation/collections
echo "">"$collection/custom-__RANDOM__.cfg"

cd $roms
extensions=${extensions//\,/\\\|}

echo "Random ROM collection...."
for f in $(find $roms -regex ".*\.\($extensions\)"|shuf -n $files); do
  file=$(echo $f | rev | cut -d'/' -f1 | rev)
  echo "$file"
  echo "$f">>"$collection/custom-_RANDOM_.cfg"
done
echo "-------------"
custom_collections=__RANDOM__

for d in $(ls $roms -r); do
  echo "">"$collection/custom-_RANDOM_$d.cfg"
  # search all files in archive/
  roms_found=0
  for f in $(find $roms/$d/$archive -regex ".*\.\($extensions\)"|shuf -n $files); do
    file=$(echo $f | rev | cut -d'/' -f1 | rev)
    echo "$f">>"$collection/custom-_RANDOM_$d.cfg"
    roms_found=1
  done

  if [ $roms_found -eq 1 ]; then 
    custom_collections=$custom_collections,_RANDOM_$d
  fi
done
# settings file
settings_file=/opt/retropie/configs/all/emulationstation/es_settings.cfg
# replace collection lists
sed -i "/<string\sname=\"CollectionSystemsCustom\"/c\<string name=\"CollectionSystemsCustom\" value=\"$custom_collections\" \/\>" $settings_file

# restore $IFS
IFS=$SAVEIFS
