ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(rails4 tmux)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ls='ls -G'
alias ll='ls -lG'
alias g='git'
alias tk='tmux kill-session -t '

export EDITOR=vi
set -o emacs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
