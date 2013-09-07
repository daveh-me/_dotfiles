ZSH=$HOME/.oh-my-zsh
ZSH_THEME="kphoen"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(rails4)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ls='ls -G'
alias ll='ls -lG'
alias g='git'
alias tk='tmux kill-session -t '

export EDITOR=vi
set -o emacs
