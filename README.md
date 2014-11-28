# vimfiles

My VIM Configuration:

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
git clone --recursive https://github.com/icatalina/vimfiles.git
```

My recomendation is to run this set of commands:

```shell
cd
git clone --recursive https://github.com/icatalina/vimfiles.git .vim
ln -s .vim/vimrc .vimrc
```

That should change the current directory to your personal folder, clone the repo and submodules in the .vim folder and then create a link for the .vimrc file.


