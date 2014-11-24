ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(tmux git)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ack='nocorrect ack'
alias g='git'
alias gst='git status'
alias ls='ls -G'
alias ll='ls -lG'
alias psg='ps -ef | grep '
alias rbp='rails_best_practices -f html --with-git'
alias rc='rubocop -R'
alias rdbm='rake db:migrate && RAILS_ENV=test RAILS_ENV=test rake db:migrate'
alias rdbs='rake db:seed'
alias rerd='rake erd polymorphism=true inheritance=true'
alias rg='rails generate'
alias rspec='nocorrect rspec'
alias tk='tmux kill-session -t '
alias tmx='TERM=xterm-256color tmux'
alias ..='cd ..'
alias ...='cd ../..'

export DYLD_LIBRARY_PATH=/usr/local/oracle/11gCli/instantclient/
export NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252
export ELASTICSEARCH_URL=http://localhost:9200

export PATH=$PATH:/usr/local/oracle/11gCli/instantclient/
export PATH="/Users/dave/Library/Haskell/bin:/usr/local/bin:$PATH"
export VISUAL=vim
export EDITOR=$VISUAL
set -o emacs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
