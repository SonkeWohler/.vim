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
    echo "replace file (r), store file (s) or open (o)?"
    read -n 1 yesNo
    echo ""
    # todo lower case yesNo
    if [ $yesNo = "r" ]; then
      rmv quickNotes.txt
    elif [ $yesNo = "s" ]; then
      if test -f $writingCD/quickNotes/quickNotes.txt; then
        echo "file already exists, overwrite? (y/n)"
        read -n 1 anotherYesNo
        echo ""
        if [ anotherYesNo = "y" ]; then
          mvv quickNotes.txt $writingCD/quickNotes/
        else
          echo "no action"
          # todo loop to allow opening file again or if (y/n) was invalid
        fi
      fi
    elif [ $yesNo != "o" ]; then
      echo "invalid reply"
      rmv quickNotes.txt
    fi
  fi
  vim quickNotes.txt +startinsert
  if test -f quickNotes.txt; then
    echo "save file to writingLibrary (s) or remove (r)?"
    read -n 1 yesNo
    echo ""
    if [ $yesNo = "r" ]; then
      rmv quickNotes.txt
    elif [ $yesNo = "s" ]; then
      mvv quickNotes.txt $writingCD/quickNotes/
    else
      echo "invalid response"
      echo "no action"
    fi
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
