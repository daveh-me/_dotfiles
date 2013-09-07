# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(rails4)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
stty -ixon

alias g='git'
alias tk='tmux kill-session -t '
