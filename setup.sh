#!/bin/bash

# List of all packages to install.
# Currently this requires that each package
# lives on github.com
PACKAGES=(
    "sirver/UltiSnips"
    "tpope/vim-commentary"
    "tpope/vim-surround"
    "togglebyte/togglerust"
    "junegunn/fzf"
    "junegunn/fzf.vim"
    "rust-lang/rust.vim"
    "vimwiki/vimwiki"
    "tpope/vim-fugitive"
    "neovim/nvim-lspconfig"
    "zah/nim.vim"
)

if [[ $1 == "--init" ]]
then
    # Create the pack/dev/start directory 
    # and clone all the plugins into it
    # also symlink everything to ~/.vim and ~/.vimrc
    mkdir -p pack/dev/start
    mkdir -p ~/.vim
    ln -sf `pwd`/nolua.vim $HOME/.vimrc
    ln -sf `pwd`/after $HOME/.vim/
    ln -sf `pwd`/pack $HOME/.vim/
    ln -sf `pwd`/colors $HOME/.vim/
    ln -sf `pwd`/spell $HOME/.vim/
    ln -sf `pwd`/UltiSnips $HOME/.vim/

    cd pack/dev/start
    for package in "${PACKAGES[@]}"
    do
        git clone "https://github.com/$package"
    done
else
    # Git pull every package in pack/dev/start
    for package in `ls pack/dev/start`
    do
        path="pack/dev/start/$package"
        (cd $path && git pull)
    done
fi
