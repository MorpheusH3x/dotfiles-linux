#!/bin/bash

PWD=`pwd`
echo $PWD

FILE="~/.p10k.zsh"
if test -f "$FILE"; then
       rm $FILE
fi
ln -s ${PWD}/.p10K.zsh ~/.p10k.zsh

FILE="~/.tmux.conf"
if test -f "$FILE"; then
     	rm $FILE
fi
ln -s ${PWD}/.tmux.conf ~/.tmux.conf

FILE="~/.zshrc"
if test -f "$FILE"; then
	rm $FILE
fi
ln -s ${PWD}/.zshrc ~/.zshrc

echo "All conf files are liked to the GH repo"
