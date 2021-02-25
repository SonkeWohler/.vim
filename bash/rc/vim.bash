### --- anything vim related --- ###

# in case that anything is wrong with vim or special use cases
alias novim='vim -u NONE' 
alias vimdd="cdd && vim && cd-"
alias vimd="vimdd"

#-- for quick temporary notes
vimt() {
  cdt
  if test -f quickNotes.txt; then
    echo "quickNotes.txt exists already!"
    echo "remove file (r) or open (o)?"
    read yesNo
    # todo lower case yesNo
    if [ $yesNo = "r" ]; then
      rmv quickNotes.txt
    elif [ $yesNo != "o" ]; then
      echo "invalid reply"
      rmv quickNotes.txt
    fi
  fi
  vim quickNotes.txt
  if test -f quickNotes.txt; then
    rmv quickNotes.txt
  fi
  cd-
}

#-- for quick permanent notes that are accesible online (privately)
# requires $writingCD to be set and internet with github credentials saved
vimNotes(){
  # if required bookmark missing exit
  if [ $writingCD = "" ]; then
    echo "missing bookmark 'writingCD'"
    return
  fi
  # write note
  cd $writingCD
  vim notes.md
  echo " --- uploading to github --- "
  # update remote
  git restore --staged :/
  git add notes.md
  git commit -m "quick notes"
  git pull
  git push
  # return to previous file location
  cd -
}
