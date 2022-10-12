#!/bin/bash

echo "------------------"
echo "this sets up kde related files"
echo "AND IT OVERWRITES THOSE YOU ALREADY HAVE!!!"
echo "you should restart your xsession after this to see whether everything worked as intended"
echo "any files that are replaced are copied to $file.old, so you should be able to restore things from a terminal session relatively easily"
echo "------------------"

cd ../config
sudo mkdir /usr/share/backgrounds
sudo chmod -R +r /usr/share/backgrounds
cp -v ./backgrounds/ddforest.jpeg /usr/share/backgrounds/

./copykde.sh
cd -

