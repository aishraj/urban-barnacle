set -g fish_greeting ""
set PATH /usr/local/bin $PATH

alias reload "exec fish"

alias gco "git checkout"
alias gc "git commit -m"
alias gl "git log -1 --format='%H'"

# Setup Starship
starship init fish | source