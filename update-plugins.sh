#!/usr/bin/env dash

quiet=$1

#self update the config itself
mv $HOME/.vimrc $HOME/.vimrc.bak
curl https://raw.githubusercontent.com/Ardakilic/arvim/master/.vimrc > $HOME/.vimrc
printf 'Vim configuration updated, old one saved as .vimrc.bak'

if [ -d "$HOME/.vim/autoload" ]; then
    cd "$HOME/.vim/autoload"
    curl -O https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

if [ -d "$HOME/.vim/bundle" ]; then
    for bundle in "$HOME/.vim/bundle/"*
    do
        if [ -d "$bundle/.git" ]; then
            if [ "$quiet" != "-q" ]; then
                printf "Working on %s...\n" ${bundle##*/}
                cd "$bundle"; git pull 2>/dev/null
            else
                cd "$bundle"; git pull 1>/dev/null 2>&1
            fi
        fi
    done
fi
