#!/bin/bash

echo "------------------"
echo "this sets up kde related files"
echo "AND IT OVERWRITES THOSE YOU ALREADY HAVE!!!"
echo "you should restart your xsession after this to see whether everything worked as intended"
echo "any files that are replaced are copied to $file.old, so you should be able to restore things from a terminal session relatively easily"
echo "------------------"

setupCD=$(pwd)

cd /usr/share
sudo mkdir backgrounds
sudo chmod -R +r backgrounds
cp -v $setupCD/../config/ddforest.jpeg /usr/share/backgrounds/

cd $setupCD/../config
./copykde.sh
cd $setupCD

