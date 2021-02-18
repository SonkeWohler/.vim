echo configuration loading: Soenke Default # sometimes used for debugging

### --- note: single `#` is used for comments, usually at the end of the line
### --- note: double `##` is used to comment out lines of code, much like is convention in vimrc

# currently in debugging mode, shouldn't be committed like that
##set -x 

### --- some important file locations
# -- defaults
tempCD="/d/temp"
vimCD="$HOME/.vim"
# -- specific to the machine, overwriting defaults
bashLocationsFile="$HOME/locationsForCD.bash"
if test -f $bashLocationsFile; then
  source $bashLocationsFile 
  echo "sourced" $bashLocationsFile
else
  echo "couldn't source" $bashLocationsFile "see ~/.vim/README.md under '#### Bash'"
fi

# where the remaining setup files are
cd $vimCD/bash 

### --- source default bashrc files
for file in rc/*; do
  source $file
done

### --- sourcing optional content
# sdkman https://sdkman.io/
alias sdkSource='source ~/.sdkman/sourceSDK'


### --- final toughes

# sometimes bash is started in a different directory from ~ (e.g. in administrator rights)
cdv 
