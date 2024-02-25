if status is-interactive
    set fish_greeting "Asta e Pestisorul meu"
    starship init fish | source
    fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv --processes=\e\cp
end
