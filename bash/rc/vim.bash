### --- anything vim related --- ###

# in case that anything is wrong with vim or special use cases
alias vim='vim -u NONE'
# open multiple files in tabs, and using 'vi' is quite short and common
alias vi='nvim -p'
# quick local notes
alias nvimnw='nvim -c 'Neorg workspace work''
alias nvimn='nvimnw'

#-- for quick temporary notes
alias vimt='nvimt'
nvimt() {
  if [ $tempCD ] ; then
    cd $tempCD
  else
    echo "tempCD variable is undefined, command failed"
    return
  fi
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
  nvim quickNotes.txt +startinsert
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
  cd -
}

#-- for quick permanent notes that are accesible online (privately)
# requires $writingCD to be set and internet with github credentials saved
alias vimNotes='nvimNotes'
nvimNotes(){
  # if required bookmark missing exit
  if [ $writingCD ]; then
    cd $writingCD
  else
    echo "writingCD variable is undefined, command failed"
    return
  fi
  # write note
  nvim notes.md
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

#-- journal entries
# requires $writingCD to be set and internet with github credentials saved
alias diary='cd $writingCD/diary'
alias nvimd='nvimdd'
alias vimd='nvimdd'
alias vimdd='nvimdd'
nvimdd() {
  #-- does library exist on this machine?
  if not test $writingCD  ; then
    echo '$writingCD undefined, command failed'
    return
  fi
  if test -z $writingCD ; then
      echo '$writingCD improperly defined, command failed'
      return
  fi
  if test -d $writingCD ; then
      cd $writingCD
  else
      echo "$writingCD is not a directory, command failed"
      return
  fi
  #-- get current date
  # if $1 is an offset in days i.e. "+4" or "-1"
  if echo $1 | grep -Eq "[+-][0-9]+" ; then
    title=$(date --date "$1 days" +'%Y/%m/%d')
  # if $1 is the day of the month i.e. "22" or "5"
  elif echo $1 | grep -Eq "[0-9]+" ; then
    year=$(date +"%Y")
    month=$(date +"%m")
    title=$(date --date "$year-$month-$1" )
  # if $1 is not a date argument that is currently accepted
  else
    title="now"
  fi
  #-- format the date
  filename="simpleEntries/$(date --date "$title" +'%Y.%m.%d').md"
  title="# $(date --date "$title" +'%d/%m/%Y')"
  #-- create file... or not?
  if test -f $filename ; then
    echo "today's entry has already been started"
  else
    echo "$title" > "$filename"
  fi
  nvim $filename
  #-- update remote
  git restore --staged :/
  git add $filename
  git commit -m "diary entry"
  echo "upload to github? (y/n)"
  read -n 1 yesNo
  echo ""
  # todo lower case yesNo
  if [ $yesNo = "y" ]; then
    git pull
    git push
  else
    echo "not uploading"
    echo "feel free to upload later"
  fi
  echo "---"
  # return to previous file location
  cd -
}
