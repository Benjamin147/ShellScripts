#!/usr/bin/bash 

# which prefix u want to convert to
old='png'
# new data format for all of this files
new='png'
backupfolder='backupfolder'
mkdir '../'$backupfolder

files=`ls *.$old`
counter=1
num=0
for file in $files
do 
   num=$((num+1))
done

for file in $files
do
   echo '('$counter' of '$num') '$file
   newfile=${file::-4}'.'$new
   cp $file '../'$backupfolder
   convert -density 300 -resize 1024 $file $newfile 
   # <--- Stell die Auflösung hier ein, die 1024 sind die x-Achse des Bildes, y wird dann entsprechend gesetzt
   # -density ist hier die dpi
   #mv $file $backupfolder
   counter=$((counter+1))
done
