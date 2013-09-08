ZSH=$HOME/.oh-my-zsh
ZSH_THEME="terminalparty"
plugins=(rails4 tmux git)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ls='ls -G'
alias ll='ls -lG'
alias g='git'
alias tk='tmux kill-session -t '
alias tmux='TERM=xterm-256color tmux'

export VISUAL=vim
export EDITOR=$VISUAL
set -o emacs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
