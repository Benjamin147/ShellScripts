#!/usr/bin/bash 

old='png'
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
   #mv $file $backupfolder
   counter=$((counter+1))
done
