### --- ripgrep and related

# configure ripgrep
# since this doesn't have a default config file location?
export RIPGREP_CONFIG_PATH="$vimCD/config/ripgreprc"

# search with pager, I am experimenting with different options
rgg() { rg --json $@ | dlt ; }
alias rgb='batgrep'

### --- general paging - mostly bat

# basically batman, but this way I get completion
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

### --- find = fd

# usually I prefer having a pager, because then scrolling up isn't ass spammed
fdd() { fd $@ | dlt ;}
# include hidden, but not git, files only
ff() { fdd --hidden --type f --exclude .git $@ | dlt ;}
