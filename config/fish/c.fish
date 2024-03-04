if status is-interactive
    set fish_greeting "Asta e Pestisorul meu"
    starship init fish | source
    fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv --processes=\e\cp

    # --- functions
    function delta-standard-pager --description 'delta with standard-options' ; delta --paging=always ; end
    alias dlt delta-standard-pager
    function rgg
        rg --json $argv | delta-standard-pager
    end

    # --- abbreviations
    # usually just a copy of `abbr --show`
    abbr -a -- vi 'nvim -p'
    abbr -a -- vimu 'vim -u NONE'
    abbr -a -- nvimu 'nvim -u NONE'
    abbr -a -- sedn 'sed -En'
    abbr -a -- lsa 'ls -lAFh'
end
