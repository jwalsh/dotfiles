#!/bin/sh 
# Set up the symlinks for dotfiles

PWD=$(dirname $0)

for F in .emacs .zshrc .zshenv .zprofile
do 

    # We don't want backups of symlinks
    if [ -h ~/$F ] 
    then
        rm ~/$F
        if [ $? -eq 0 ]
        then
            echo Note: $F symlink updating
        fi
    fi

    if [ -f ~/$F ] 
    then
        mv ~/$F ~/$F.dotfiles 
        if [ $? -eq 0 ]
        then
            echo Backup: ~/$F.dotfiles.$$
        else 
            echo Error: $F not moved
            exit 1
        fi
    fi

    ln -sf $PWD/$F ~/$F
    echo $PWD/$F ~/$F

done
