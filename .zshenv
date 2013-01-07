PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=~/bin:$PATH
export PATH

export JAVA_HOME=$(/usr/libexec/java_home)
export JRE_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

export JAVA_OPTS="-Xmx1024m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled"

export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
export HADOOP_HEAPSIZE=2000

export CATALINA_HOME=~/opt/tomcat
exoprt TOMCAT_HOME=$CATALINA_HOME
export PATH=$CATALINA_HOME/bin:$PATH
export CATALINA_OPTS="-Xms2048m -Xmx2048m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled -Dcom.sun.management.jmxremote"

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
