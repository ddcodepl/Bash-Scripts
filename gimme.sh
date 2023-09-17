#!/bin/bash

git1() {
    STASH="gimme-cmd-stash-"$(date +"%s")i
    git stash save $STASH
    STASH_REF="$(git stash list | grep "$STASH" | awk -F: '{ print $1 }')"
    git fetch && git checkout $1 && git pull
    if [ "$STASH_REF" != "" ]; then
        git stash pop "$STASH_REF"
    else
        echo "No local changes, nothing was stashed"
    fi
}

git2() {
    if [[ "$OSTYPE" =~ "darwin" ]]; then
        # MAC
        ESC="\x1B"
    else
        ESC="\e"
    fi

    for i in *; do
        if [ -d "$i/.git" ]; then
            echo -e "$ESC[01;36m-----> "$i"$ESC[0m"
            echo
            cd $i
            git1 $1
            cd ..
            echo
        fi
    done
}

if [ -z $1 ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "This script changes the branch of git projects preserving changes (by using stash)"
    echo "Usage:"
    echo "gimme <branch> - switch the current folder to <branch>"
    echo "gimme all <branch> - switch all subfolders to <branch>"
    echo
    exit 1
elif [ "$1" == "all" ]; then
    git2 "$2"
elif [ ! -z $1 ]; then
    git1 "$1"
fi