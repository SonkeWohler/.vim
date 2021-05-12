### --- general purpose --- ###

### --- bindings

# i prefer to type `clear` out and now I found a use for \C-l
bind '"\C-l":" | lessx"' 

### --- editor related

# for <C-x-e>
EDITOR="vim"

# set vi mode 
##set -o vi 

### --- workarounds

# reduces issues related to Capslock being mapped to Ctrl
alias exx='sleep 0.25s ; exit' 
# sometimes I like to do it this way
alias :q='exx'
