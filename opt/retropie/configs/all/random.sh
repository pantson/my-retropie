#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# number of random files of each emuulator
files=5

# roms dir
roms=/home/pi/RetroPie/roms

cd $roms

# dir for all roms
archive=archive

for d in $(ls -r); do
  if [ -d "$d/$archive" ]; then

    echo "$d roms"
    echo "=========================" 

    # remove files already there (all files except .sha and .xml)
    (find $d -maxdepth 1 -type f -not -name '*.sh' -not -name '*.xml') | xargs -d '\n' rm

	# search all files in archive/
    for f in $(find $d/$archive|shuf -n $files); do
      file=$(echo $f | rev | cut -d'/' -f1 | rev)
      echo "$file"
      cp $f $roms/$d/$file
    done
    echo ""
  fi
done

# restore $IFS
IFS=$SAVEIFS
