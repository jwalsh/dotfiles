# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

plugins=(git)

source $ZSH/oh-my-zsh.sh

PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=~/bin:$PATH

alias cd-c='pwd | pbcopy'
alias cd-p='cd $(pbpaste)'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
