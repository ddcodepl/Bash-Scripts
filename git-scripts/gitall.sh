#!/bin/bash
#
# Usage: gitall status
#        gitall fetch
#        gitall checkout master
#        gitall ...git parameters...
#

if [[ "$OSTYPE" =~ "darwin" ]]; then
    # MAC
    ESC="\x1B"
else
    ESC="\e"
fi

echo -n -e "\nCOMMAND: "
echo -e "$ESC[01;33m$(basename $0) $*$ESC[0m\n"

for i in *; do
    if [ -d "$i/.git" ]; then
        echo -e "$ESC[01;36m-----> "$i"$ESC[0m"
        echo
        cd $i
        git $*
        cd ..
        echo
    fi
done