#!/bin/bash

dir=`pwd`

#replace ~/.emacs and ~/.emacs.d
if [ -f ~/.emacs ];
then
    echo "backup old dot emacs file: mv .emacs .emacs.old"
    mv ~/.emacs ~/.emacs.old
fi
ln -s $dir/emacs-config/.emacs ~/.emacs

if [ -d ~/.emacs.d ];
then 
    echo "backup old dot emacs directory: mv .emacs.d .emacs.d.old"
    mv ~/.emacs.d ~/.emacs.d.old
fi
ln -s $dir/emacs-config/.emacs.d/ ~/.emacs.d

#replace ~/.bashrc
if [ -f ~/.bashrc ];
then
    echo "backup old bashrc file: mv .bashrc .bashrc.old"
    mv ~/.bashrc ~/.bashrc.old
fi
ln -s $dir/bash-config/.bashrc ~/.bashrc

#replace ~/.Xresources
if [ -f ~/.Xresources ];
then
    echo "backup old .Xresources file: mv .Xresources .Xresources.old"
    mv ~/.Xresources ~/.Xresources.old
fi
ln -s $dir/xterm-config/.Xresources ~/.Xresources
xrdb ~/.Xresources
