alias ..='cd ..'
alias ...='cd .. && cd ..'
alias l='ls -la'
set_v_alias() {
    if command -v nvim &>/dev/null; then
        alias v='nvim'
    elif command -v vim &>/dev/null; then
        alias v='vim'
    fi
}
set_v_alias
