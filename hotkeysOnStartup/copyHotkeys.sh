### this script copies the autohotkey scripts into the location where the system will look for them on startup.
### It is essentially deploying the scripts rto production. See the readme why you should be carefulw ith this.
cd scripts/
cp -vr ./ ~/hotkeysOnStartup/
cd -
