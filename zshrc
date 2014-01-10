ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(tmux git)
source $ZSH/oh-my-zsh.sh

# stop <ctrl>-s locking the terminal
stty -ixon

alias ack='nocorrect ack'
alias g='git'
alias gbt='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias ls='ls -G'
alias ll='ls -lG'
alias psg='ps -ef | grep '
alias rbp='rails_best_practices -f html --with-git'
alias rcane='cane --max-violations 20 --style-measure 90 --style-glob {app,lib}/**/*.rb'
alias rdbm='rake db:migrate && RAILS_ENV=test RAILS_ENV=test rake db:migrate'
alias rdbs='rake db:seed'
alias rerd='rake erd polymorphism=true inheritance=true'
alias rg='rails generate'
alias rspec='nocorrect rspec'
alias tk='tmux kill-session -t '
alias tmux='TERM=xterm-256color tmux'
alias ..='cd ..'
alias ...='cd ../..'

export DYLD_LIBRARY_PATH=/usr/local/oracle/11gCli/instantclient/
export NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252
export ELASTICSEARCH_URL=http://localhost:9200

export PATH=$PATH:/usr/local/oracle/11gCli/instantclient/
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export VISUAL=vim
export EDITOR=$VISUAL
set -o emacs

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
