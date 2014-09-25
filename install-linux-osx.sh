#!/bin/bash

echo '""""""""""""""""""""""""""""""""""'
echo '"     ___        _    ___'
echo '"    /   |  ____| |  / (_)___ ___'
echo '"   / /| | / ___/ | / / / __ `__ \'
echo '"  / ___ |/ /   | |/ / / / / / / /'
echo '" /_/  |_/_/    |___/_/_/ /_/ /_/'
echo '"'
echo '""""""""""""""""""""""""""""""""""'


echo '""""""""""""""""""""""""""""""""""'
echo '"Welcome to Arvim installer'
echo '"'
echo '"https://github.com/Ardakilic/arvim'
echo '""""""""""""""""""""""""""""""""""'

HASERROR=no
if ! which vim > /dev/null;
    then
    echo '"vim is not installed yet, you must install it first'
    HASERROR=yes
fi
if ! which ctags > /dev/null; 
then
    echo '"ctags is not installed yet, you must install it first'
    HASERROR=yes
fi
if ! which git > /dev/null; 
    then
        echo '"git is not installed yet, you must install it first'
        HASERROR=yes
fi

if [ "$HASERROR" == yes ];
then
    echo '"'
    echo '"Please check the errors and try re-running this installer'
    echo '"'
else
    echo '"'
    echo '"Installing and running Arvim, please wait...'
    echo '"'
    cd $HOME
    rm -rf .vim .vimrc arvim
    git clone --recursive https://github.com/Ardakilic/arvim.git
    cd arvim
    mv .vim .vimrc $HOME
    rm -rf $HOME/arvim
    cd $HOME
    vim +PluginInstall +qall
fi
