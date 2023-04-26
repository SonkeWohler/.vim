### --- general purpose --- ###

### --- memory helps
# timer
mytimednotify() {
    if test -z $2; then
        message='...'
    else
        message="$2"
    fi
    if test -z $1; then
        time='1m'
    else
        time="$1"
    fi
    code=$(sleep $time && notify-send $message --action 'done' --action '+1min' --action 'repeat' --app-name 'note to self' --wait --expire-time 300000)
    if test $code -eq 1; then
        mytimednotify '1m' $message
    else
        if test $code -eq 2; then
            mytimednotify $time $message
        fi
    fi
}

remindme() {
    mytimednotify $@ &
}


### --- updates
# pip is a little hands on
alias updatePip='pip list --outdated | awk "NR>2 {print \$1}" | xargs -I {} pip install {} --upgrade'
# neovim has a few things
alias updateNvim='nvim -c TSUpdate -c MasonUpdate -c PackerSync && nvim -c Mason'
# the rest has simple commands, but I usually use them all at once
alias updateAll='yay && sudo npm --global update && flatpak update && updatePip && rustup update && cargo install-update -a && updateNvim'
alias pullAndUpdateAll='cdw && make pull-and-rebuild-dev && cdv && git pull && updateAll'

### --- sudo

#-- aliases
# https://wiki.archlinux.org/title/Sudo#Passing_aliases
alias sudo='sudo '

### --- fzf

# load completions and other useful stuff
# these files may be in slightly different locations on different machines
fzfPath="/usr/share/doc/fzf/examples/key-bindings.bash"
if ! test -f "$fzfPath"; then
  fzfPath=$(echo "$fzfPath" | perl -pe "s/examples\///g")
  if ! test -f "$fzfPath"; then
    fzfPath=$(echo "$fzfPath" | perl -pe "s/doc\///g")
    if ! test -f "$fzfPath"; then
      echo "could not source fzf completion files.  Is it installed?"
    fi
  fi
fi
source "$fzfPath"
fzfPath=$( echo "$fzfPath" | perl -pe "s/key-bindings\.bash/completion.bash/g")
source "$fzfPath"

### --- bindings

# my new keyboard doesn't have a | or \ key where I like it
# I know this should principally happen on a per machine basis (machine local
# bashrc/inputrc) but I got so used to this that I like having it in all my
# systems --- sue me
bind '"\e`":"|"'
bind '"\eq":"|"'
bind '"\ez":"\\"'

### --- office

scimage() {
  scanimage --format=png -d 'airscan:e0:HP ENVY 4500 series [61441F] (USB)' >> "$1"
}

### --- editor related

# vim with fzf
# this is only necessary on systems where fzf the vim plugin and fzf the bash
# tool don't play nice
alias vimf='vim -o `fzf`'
alias vif='vimf'

### --- code cleanup

#-- Latex
# cleanup compilation files
alias cleanLatex='find . | grep -v ".git" | grep -P "\.pdf|\.aux|\.log|\.out" | xargs rm -v'

# xclip
# alias xclipp='xclip -selection clipboard'
# fix stuff being copied to clipboard but not primary
alias fclip='xclip -selection clipboard -out | xclip -selection primary -in'

#-- python
# clean and check and all that
# can be run on directories
clean_py() {
  if [[ $1 = "-l" ]] || [[ $1 = "l" ]] || [[ $1 = "local" ]] || [[ $1 = "--local" ]]; then
    logfilename="./"
    shift
  else
    logfilename="/tmp/$(date --date now +'%Y.%m.%d-%H.%M.%S')"
  fi
  if test -z "$1"; then
    echo "requires non-zero filepath"
    return 1
  fi
  echo 'running isort ... '
  isort $@
  echo 'running black ... '
  black --skip-string-normalization --line-length 79 $@
  echo 'running pylint >> /tmp/<date>.pylint.log ...'
  pylint $@ --output="$logfilename.pylint.log"
  cat "$logfilename.pylint.log"
  echo 'running mypy >> /tmp/<date>.mypy.log ...'
  mypy $@ > "$logfilename.mypy.log"
  cat "$logfilename.mypy.log"
  echo "pylint output has been saved to $logfilename.pylint.log" 
  echo "mypy output has been saved to $logfilename.mypy.log"
}

alias cleanpy='clean_py'
alias cleanPy='clean_py'
alias clp='clean_py'

alias pp='poetry'

#-- npm and node

# https://wiki.archlinux.org/title/Node.js#Node_Packaged_Modules
##source /usr/share/nvm/init-nvm.sh
alias nvm='n'

# running cypress
alias npc='npx cypress open --config watchForFileChanges=false'
##alias cywms='cd $workCD/ui && npc && cd -'
cywms() {
  cd $workCD/ui || return 1
  logfilename="/tmp/$(date --date now +'%Y.%m.%d-%H.%M.%S').cypress.log"
  npx cypress open --config watchForFileChanges=false &>> $logfilename &
  echo "cypress logfile at $logfilename"
  cd -
}
