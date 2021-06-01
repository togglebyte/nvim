#!/bin/bash

# List of all packages to install.
# Currently this requires that each package
# lives on github.com
PACKAGES=(
    "neovim/nvim-lspconfig"
    "sirver/UltiSnips"
    "tpope/vim-commentary"
    "tpope/vim-surround"
    "togglebyte/togglerust"
    "junegunn/fzf.vim"
    "rust-lang/rust.vim"
    "sunaku/vim-dasht"
)

if [[ $1 == "--init" ]]
then
    # Create the pack/dev/start directory 
    # and clone all the plugins into it
    mkdir -p pack/dev/start
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
