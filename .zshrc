# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

COMPLETION_WAITING_DOTS="true"

plugins=(git rails gitflow brew github git heroku lein gpg-agent rails3 redis-cli rvm yum)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:~/bin
# EC2
PATH=$PATH:/bin:/usr/bin:/opt/aws/bin:/home/ec2-user/bin
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

alias cd-c='pwd | pbcopy'
alias cd-p='cd $(pbpaste)'


