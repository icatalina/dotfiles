# DotFiles

This repo contains my dotfiles. You should put it in the `~/.cfg` folder and
symlink everything to your home folder:

```sh
cd ~
git clone https://github.com/icatalina/dotfiles.git .cfg
ln -s ~/.cfg/vim .vim
ln -s ~/.cfg/zshrc .zshrc
ln -s ~/.cfg/git ~/.config/git
ln -s ~/.cfg/hammerspoon ~/.hammerspoon
ln -s ~/.cfg/editorconfig ~/.editorconfig
ln -s ~/.cfg/tigrc ~/.tigrc
```

There is also an **iTerm2** configuration file in `iterm2/`.

## Brew
To install brew, follow the instructions in: [https://brew.sh/](https://brew.sh/)

There is a script to install all packages in `bootstrap/brew.sh`

- [Brew Package List](#brew-package-list)
- [Cask Package List](#cask-package-list)

## Pure Prompt

In order for Zsh to function properly you need to install [Pure Prompt](https://github.com/sindresorhus/pure):

```sh
$ npm install --global pure-prompt
```

## Brew Package List:
> To see an up to date list, check `bootstrap/brew.sh`

- **bash**: Bourne-Again SHell, a UNIX command interpreter
- **coreutils**: GNU File, Shell, and Text utilities
- **diffutils**: File comparison utilities
- **editorconfig**: Maintain consistent coding style between multiple editors
- **file-formula**: Utility to determine file types
- **findutils**: Collection of GNU find, xargs, and locate
- **fswatch**: Monitor a directory for changes and run a shell command
- **fzf**: Command-line fuzzy finder written in Go
- **gawk**: GNU awk utility
- **git**: Distributed revision control system
- **gnu-indent**: C code prettifier
- **gnu-sed**: GNU implementation of the famous stream editor
- **gnu-tar**: GNU version of the tar archiving utility
- **gnu-typist**: GNU typing tutor
- **gnu-which**: GNU implementation of which utility
- **gnutls**: GNU Transport Layer Security (TLS) Library
- **gource**: Version Control Visualization Tool
- **grep**: GNU grep, egrep and fgrep
- **gzip**: Popular GNU data compression program
- **highlight**: Convert source code to formatted text with syntax highlighting
- **htop**: Improved top (interactive process viewer)
- **hub**: Add GitHub support to git on the command-line
- **jq**: Lightweight and flexible command-line JSON processor
- **less**: Pager program similar to more
- **ncdu**: NCurses Disk Usage
- **rename**: Perl-powered file rename script with many helpful built-ins
- **burntsushi/ripgrep/ripgrep-bin**: Search tool like grep and The Silver Searcher.
- **rsync**: Utility that provides fast incremental file transfer
- **ruby**: Powerful, clean, object-oriented scripting language
- **screen**: Terminal multiplexer with VT100/ANSI terminal emulation
- **tig**: Text interface for Git repositories
- **trash**: CLI tool that moves files or folder to the trash
- **tree**: Display directories as trees (with optional color/HTML output)
- **unzip**: Extraction utility for .zip compressed archives
- **vim**: Vi 'workalike' with many additional features
- **watch**: Executes a program periodically, showing output fullscreen
- **watchman**: Watch files and take action when they change
- **z**: Tracks most-used directories to make cd smarter
- **zsh**: UNIX shell (command interpreter)

## Cask Package List:
> To see an up to date list, check `bootstrap/brew.sh`

#### Browsers
- Firefox
- firefox Developer Edition
- Google Chrome
- Google Chrome Canary
- Opera

#### Editors
- Atom
- visual Studio Code

#### DEV
- Iterm2
- VirtualBox

#### Social
- Nylas Mail
- Slack

#### Tools
- Filezilla
- Fork
- Imageoptim
- Keka
- Lastpass
- Licecap

#### Miscellaneous
- Colorpicker Skalacolor
- Gpgtools
- Hammerspoon
- Logitech Options
- Quicklook Csv
- Quicklook Json

#### Multimedia
- VLC
- Vox
