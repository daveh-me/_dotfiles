ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(tmux git)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ack='nocorrect ack'
alias g='git'
alias ls='ls -G'
alias ll='ls -lG'
alias psg='ps -ef | grep '
alias rbp='rails_best_practices -f html --with-git'
alias rcane='cane --max-violations 20 --style-measure 90 --style-glob {app,lib}/**/*.rb'
alias rdbm='rake db:migrate db:test:clone'
alias rdbs='rake db:seed'
alias rerd='rake erd polymorphism=true inheritance=true'
alias rg='rails generate'
alias rspec='nocorrect rspec'
alias tk='tmux kill-session -t '
alias tmux='TERM=xterm-256color tmux'
alias ..='cd ..'
alias ...='cd ../..'

export VISUAL=vim
export EDITOR=$VISUAL
set -o emacs

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
