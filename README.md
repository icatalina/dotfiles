# dotFiles

Various Configuration files for:

  - Zsh
  - Vim
  - MacVim
  - Bash

##My VIM Configuration:

![vim](https://cloud.githubusercontent.com/assets/4542735/5229851/7a2edf78-7715-11e4-9826-9ffaa8637d1e.png)

## Included Plugins

- addon-mw-utils: https://github.com/MarcWeber/vim-addon-mw-utils
- airline: https://github.com/bling/vim-airline
- ctrlp: https://github.com/kien/ctrlp.vim
- jshint2: https://github.com/Shutnik/jshint2.vim
- multiple-cursor: https://github.com/terryma/vim-multiple-cursors
- nerdtree: https://github.com/scrooloose/nerdtree
- snipmate: https://github.com/garbas/vim-snipmate
- snippets: https://github.com/honza/vim-snippets
- tlib: https://github.com/tomtom/tlib_vim
- ultisnips: https://github.com/SirVer/ultisnips
- velocity: https://github.com/lepture/vim-velocity
- vinegar: https://github.com/tpope/vim-vinegar

## Install (*nix / mac-os)

This repo contains a few submodules, use this command to clone them automatically:

```shell
git clone --recursive https://github.com/icatalina/dotfiles.git
```

My recomendation is to run this set of commands:

```shell
git clone --recursive https://github.com/icatalina/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/vim ~/.vim
cat ~/.dotfiles/vimrc.home >> ~/.vimrc
cat ~/.dotfiles/gvimrc.home >> ~/.gvimrc
cat ~/.dotfiles/zshrc.home >> ~/.zshrc
cat ~/.dotfiles/bash_profile.home >> ~/.bash_profile
~/.dotfiles/vim/bundle/youcompleteme/install.sh
```

That should:

- Clone the repo in the .dotfiles folder
- Create a symbolic link for .vim 
- Include vimrc, gvimrc, zshrc & bash_profile in the respective files

## New Comments for gitcommits

If you want to use the new comment style for git commits:

```shell
git config --global core.commentchar="\""
```

Or under the core section on your .gitconfig file add:

```shell
commentchar="\""
```

If you don't want to use them, just delete the gitcommit.vim file from vim/syntax
