if status is-interactive
    set fish_greeting "Asta e Pestisorul meu"
    starship init fish | source
    fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv --processes=\e\cp

    # abbreviations
    # usually just a copy of `abbr --show`
    abbr -a -- vi 'nvim -p'
    abbr -a -- vimu 'vim -u NONE'
    abbr -a -- nvimu 'nvim -u NONE'
end
