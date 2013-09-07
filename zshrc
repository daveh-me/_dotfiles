# Path to your oh-my-zsh configuration.

# stop <ctrl>-s locking the terminal
stty -ixon

alias ls='ls -G'
alias ll='ls -lG'
alias g='git'
alias tk='tmux kill-session -t '

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR=vi
set -o emacs

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'
