#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" || exit 1;

cp ~/.aliases .aliases
cp ~/.brew .brew
cp ~/.exports .exports
cp ~/.functions .functions
cp ~/.gitconfig .gitconfig
cp ~/.macos .macos
cp ~/.zshenv .zshrc
cp ~/.config/nvim/init.lua .config/nvim/init.lua
cp ~/.config/nvim/old_init.vim .config/nvim/old_init.vim
