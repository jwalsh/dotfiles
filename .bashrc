
b36(){
        b36arr=(0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
        for     i in $(echo "obase=36; $1"| bc)
        do      echo -n ${b36arr[${i#0}]}
        done
        echo
}


[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
