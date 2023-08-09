### --- general paging - mostly bat

# basically batman, but this way I get completion
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

### --- ripgrep, fd and related

# configure ripgrep
# since this doesn't have a default config file location?
export RIPGREP_CONFIG_PATH="$vimCD/config/ripgreprc"

# search with pager, I am experimenting with different options
rgg() { rg --json $@ | dlt ; }
alias rgb='batgrep'

# usually I prefer having a pager, because then scrolling up isn't as spammed
fdd() { fd --color=always $@ | dlt ; }
# include hidden, but not git, files only
ff() { fdd --hidden --type f --exclude .git $@ ; }

# I often use ripgrep and fd together, and this simple setup does work
fdg() {
    ripgrepargument=$1
    shift
    fdd $@ -X rg $ripgrepargument --json
}

### --- fzf related

# use fd
export FZF_DEFAULT_COMMAND='fd --color=always --type file --follow --hidden --exclude .git'
# use default command with <C-T>
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# correctly parse color from fd
export FZF_DEFAULT_OPTS="--ansi"
