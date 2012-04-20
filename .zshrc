# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=/Users/jwalsh/sandbox/emacs/src:/Users/jwalsh/sandbox/nodelint.js:/Users/jwalsh/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/Users/jwalsh/opt/gsutil

# export PATH=/Users/jwalsh/sandbox/git-achievements:/Users/jwalsh/opt/tomcat/bin:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin:/Users/jwalsh/opt/android-sdk/tools:/Users/jwalsh/sandbox/emacs.bzr/src:/Users/jwalsh/bin:/Users/jwalsh/sandbox/phantomjs/bin/phantomjs.app/Contents/MacOS:/Users/jwalsh/.gem/ruby/1.8/bin:/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:~/sandbox/clojurescript/bin


export JAVA_OPTS="-Xmx1024m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled"
export CATALINA_OPTS="-Xms2048m -Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dcom.sun.management.jmxremote"


PATH=/usr/local/bin:$PATH

PATH=/usr/local/sbin:$PATH

PATH=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin:$PATH

PATH=~/.gem/ruby/1.8/bin:$PATH

PATH=~/sandbox/phantomjs/bin/phantomjs.app/Contents/MacOS:$PATH

PATH=~/bin:$PATH

PATH=~/sandbox/emacs.bzr/src:$PATH

PATH=~/opt/android-sdk/tools:$PATH


# Needed for npm
export NODE_PATH=$NODE_PATH:/usr/local/lib/node

JAVA4_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.4/Home
JAVA5_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home
JAVA6_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
alias java4='export JAVA_HOME=$JAVA4_HOME'
alias java5='export JAVA_HOME=$JAVA5_HOME'
alias java6='export JAVA_HOME=$JAVA6_HOME'

export JAVA_HOME=$JAVA6_HOME
export JRE_HOME=$JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH

# export JAVA_OPTS='-Xmx1024m -XX:MaxPermSize=256m'

export CATALINA_HOME=~/opt/tomcat
PATH=$CATALINA_HOME/bin:$PATH

CATALINA_OPTS="-Xms2048m -Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dcom.sun.management.jmxremote"
export CATALINA_OPTS

PATH=~/sandbox/git-achievements:$PATH
export PATH=$PATH
alias git="git-achievements"

alias mi="mvn -Dmaven.test.skip=true clean install"
alias mid="mvn -Dmaven.test.skip=true -Plocal_deploy clean install"
alias mr="mvn clean install -Pembeded tomcat:run-war -Dmaven.tomcat.port=8081 -Ddeploy.env=localhost; open http://localhost"


alias cd-c='pwd | pbcopy'
alias cd-p='cd $(pbpaste)'


