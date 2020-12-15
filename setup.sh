#!/bin/sh

echo "This script sets up your personal terminal settings."
echo "Be sure to execute this program in the \"dotfiles\" directory."

LOCATION=$(pwd)

ls -1 | while read LINE
do
    printf "Create a symbolic link ( ~/.${LINE} -> ${LOCATION}/${LINE} ) ... "
    if [[ ${LINE} != 'setup.sh' ]]; then
    	ln -sFn ${LOCATION}/${LINE} ~/.${LINE}
    fi
    printf "Done.\n"
done

echo "Completed. Enjoy it!"
