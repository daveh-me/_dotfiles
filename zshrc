ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(tmux git)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias g='git'
alias ls='ls -G'
alias ll='ls -lG'
alias psg='ps -ef | grep '
alias rdbm='spring rails db:migrate db:test:clone'
alias rerd='spring rake erd polymorphism=true inheritance=true'
alias rg='spring rails generate'
alias tk='tmux kill-session -t '
alias tmux='TERM=xterm-256color tmux'
alias ..='cd ..'
alias ...='cd ../..'

export VISUAL=vim
export EDITOR=$VISUAL
set -o emacs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
