#!/bin/bash

# List of all packages to install.
# Currently this requires that each package
# lives on github.com
PACKAGES=(
    "rust-lang/rust.vim"
    "togglebyte/togglerust"
    "togglebyte/tiny.vim"
    "sirver/UltiSnips"
    "tpope/vim-commentary"
    "tpope/vim-surround"
    "junegunn/fzf.vim"
    "vimwiki/vimwiki"
    "tpope/vim-fugitive"
    "neovim/nvim-lspconfig"
    "preservim/tagbar"
    "godlygeek/tabular"
)

# -----------------------------------------------------------------------------
# Warning: this will overwrite any existing directories <-- READ THIS
# -----------------------------------------------------------------------------
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
