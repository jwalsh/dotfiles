# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

plugins=(git rails gitflow brew github git heroku lein rails3 redis-cli rvm yum)

source $ZSH/oh-my-zsh.sh

PREFIX=~/usr/local


PATH=/usr/local/share/npm/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=~/bin:$PATH

alias cd-c='pwd | pbcopy'
alias cd-p='cd $(pbpaste)'
alias patcher='svn diff --diff-cmd /usr/bin/diff -x "-i -b"'
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# EC2
# PATH=$PATH:/bin:/usr/bin:/opt/aws/bin:/home/ec2-user/bin

alias cd-c='pwd | pbcopy'
alias cd-p='cd $(pbpaste)'

function check_compression {
  curl -s -I --compress $1 |grep "Content-Encoding"
}

# cd /opt/boxen/repo
# script/boxen --no-fde
# /opt/boxen/repo/script/boxen --no-fde
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

eval "$(rbenv init -)"
