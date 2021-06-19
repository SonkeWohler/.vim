### --- general purpose --- ###

### --- bindings

# i prefer to type `clear` out and now I found a use for \C-l
##bind '"\C-l":" | lessx"' 
# turns out that most shells don't work like git bash for windows

### --- editor related

# for <C-x-e>
EDITOR="vim"

# vim with fzf
alias vimf='vim -o `fzf`'
alias vif='vimf'

# set vi mode 
##set -o vi 

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
 alias cleanLatex='find . | grep -v ".git" | grep -P "\.pdf|\.aux|\.log" | xargs rm -v'

