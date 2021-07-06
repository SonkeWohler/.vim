### --- general purpose --- ###

### --- fzf

source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

### --- bindings

# my new keyboard doesn't have a | or \ key where I like it
bind '"\e`":"|"'
bind '"\ez":"\\"'

# i prefer to type `clear` out and now I found a use for \C-l
# edit: turns out that most shells don't work like git bash for windows
##bind '"\C-l":" | lessx"' 

### --- editor related

# for <C-x-e>
EDITOR="vim"

# vim with fzf
alias vimf='vim -o `fzf`'
alias vif='vimf'

#-- search
acks() {
  ack --color "$1" | lessx
}


### --- scoop related
# update all
scoopUp() {
  cd $scoopCD
  scoop update
  scoop update *
  cd -
}

### --- workarounds

# reduces issues related to Capslock being mapped to Ctrl
alias exx='sleep 0.25s ; exit' 
# sometimes I like to do it this way
alias :q='exx'

# xclip
alias xclipp='xclip -selection clipboard'

### --- other

#-- Latex
# cleanup compilation files
alias cleanLatex='find . | grep -v ".git" | grep -P "\.pdf|\.aux|\.log|\.out" | xargs rm -v'

