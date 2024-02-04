#!/bin/bash

if [ "$(id -u)" -eq 0 ];
then
    ln -s main.sh /usr/local/bin/fm

    if [ "$SHELL" == "/usr/bin/zsh" ];
    then
        echo "" >> "$HOME"/.zshrc
        echo "#Ncurses File Manager" >> "$HOME"/.zshrc
        echo "alias sfm='. fm'" >> "$HOME"/.zshrc
    elif [ "$SHELL" == "/usr/bin/bash" ];
    then
        echo "" >> "$HOME"/.bashrc
        echo "#Ncurses File Manager" >> "$HOME"/.bashrc
        echo "alias sfm='. fm'" >> "$HOME"/.bashrc
    fi
else
    echo "Run script with root privileges"
fi
