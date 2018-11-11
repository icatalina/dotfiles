# vim: syntax=zsh filetype=zsh foldmethod=marker

# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

__cdwhich() { #{{{
  cd "$(dirname $(which $1))"
} # }}}
__command_palette() { # {{{
  local cmd=`cat ~/.commands | awk -F " ## " '! /(^\s*$|^#)/{print "\x1b[32;1m" $1 "\x1b[37m ## " $2 "\x1b[m"}' | fzf -e -s | awk -F " ## " '{print $2}'`
  if [[ -n "$cmd" ]]; then
    local output=`eval "$cmd"`
    LBUFFER="$LBUFFER$output"
  fi
} # }}}
__git_files() { # {{{
  local file=`git -c color.status=always status --short | fzf -e -m -s | awk '{print $2}' | xargs`
  if [[ -n "$file" ]]; then
    LBUFFER="$LBUFFER$file"
  fi
} # }}}
__fancy_branch() { # {{{
  local awk_coloring='BEGIN { prev=""; color=0; } ! /^$/ { first=$1; $1 = ""; if (prev != first) { color=(color + 1) % 6; prev=first; } print "\x1b[3" color ";1m" first "\x1b[m\t" $0; }'
  local other_coloring='{print "\x1b[" color ";1m" text "\x1b[m\t" $1}'

  local branches=`git ub | awk -v color=36 -v text="local" $other_coloring`
  local remote_branches=`git branch -r | grep -v HEAD | cut -c 3-`
  local tags=`git tag -l --sort=-taggerdate | awk -v color=37 -v text="tag" $other_coloring`

  local origin=`printf $remote_branches | grep '^\s*origin/'`
  local other=`printf $remote_branches | grep -v '^\s*origin/'`
  local remote_sorted=`printf "$origin\n$other" | awk -F "/" $awk_coloring`

  local selected=`echo "$branches\n$remote_sorted\n$tags" | column -t | sed '/^$/d' | fzf --no-hscroll --ansi +m -d "\t"`

  if [[ -n "$selected" ]]; then
    local type=`printf $selected | awk '{print $1}'`
    local target=`printf $selected | awk '{print $2}'`

    if [[ "$type" == "remote" ]]; then
      target=`print $target | sed 's|.*/||'`
    fi

    if [[ -z "$LBUFFER" ]]; then
        LBUFFER="git checkout $target"
    else
        LBUFFER="$LBUFFER$target"
    fi
  fi
} # }}}
__jump_directories() { # {{{
  if [[ -z "$@" ]]; then
    local dir=`_z 2>&1 | sort -rh | awk '{print $2}' | fzf`
    if [[ -n "$dir" ]]; then
      cd $dir
    fi
  else
    _z $@
  fi
} # }}}
__mkdir_and_cd() { # {{{
  mkdir -p $1 && cd $1
} # }}}
__open_github() { # {{{
  # Github helper
  # github        -> Opens github in the current branch
  # github <hash> -> Opens selected commit in github
  if [[ "$@" == "" ]]; then
    hub browse
  else
    hub browse -- commit/$@
  fi
} # }}}

# Creating Temporal Directory if it doesn't exists
[ ! -d '~/.local/tmp' ] && mkdir -p ~/.local/tmp
[ -f '/usr/local/etc/profile.d/z.sh' ] && source '/usr/local/etc/profile.d/z.sh'

export SHELL=`which zsh`
export EDITOR=`which vim`
export VISUAL=$EDITOR

export LESS="-RFX"
export CLICOLOR=1
export LISTMAX=500

DISABLE_AUTO_TITLE="true"

# stop control flow, gimme ctrl-s back
stty -ixon

# Deleting up to the previous slash with ctrl-w
autoload -U select-word-style
select-word-style bash

# History
HISTFILE=~/.local/tmp/zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
setopt HIST_NO_FUNCTIONS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Consider directories command and CD in to them
setopt auto_cd
# Make CD push the old directory to the dir stack
setopt auto_pushd
setopt dotglob
setopt ignoreeof
setopt pushd_ignore_dups
setopt pushdminus

unsetopt nomatch

export KEYTIMEOUT=1
bindkey -e

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# .zshrc
autoload -U promptinit && promptinit

# Mac Keyboard - I hope it will work for most keyboards
# Keys {{{

SHIFT_TAB="^[[Z"
DEL_KEY="^[[3~"
ALT_LEFT="^[[1;9D"
ALT_RIGHT="^[[1;9C"
UP_ARROW="^[[A"
DOWN_ARROW="^[[B"

# }}}
# Fix Del key
bindkey $DEL_KEY    delete-char
# Move back and forward words
bindkey $ALT_LEFT   backward-word
bindkey $ALT_RIGHT  forward-word
# Shift Tab to go back in autocomplete
bindkey $SHIFT_TAB  reverse-menu-complete
# Move through history based upon was already in the prompt
bindkey $UP_ARROW   history-beginning-search-backward
bindkey $DOWN_ARROW history-beginning-search-forward

# Ctrl-X E / Ctrl-X Ctrl-E to edit command in Vi
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe'  edit-command-line
bindkey '^x^e' edit-command-line

zle -N '__command_palette'
zle -N '__fancy_branch'
zle -N '__git_files'

bindkey '^ ' __command_palette
bindkey '^b' __fancy_branch
bindkey '^g' __git_files

###########
# Aliases #
###########

## Aliases

# Wraps git to enhance the output and allow for status
__git_extended() {
  if [[ $# > 0 ]]; then
    hub $@
  elif hub rev-parse --git-dir > /dev/null 2>&1; then
    local remote_branch=`hub rev-parse --abbrev-ref @{u} 2> /dev/null | sed 's|/.*||'`
    local remote_url=`hub remote get-url $remote_branch 2> /dev/null`
    hub -c color.ui=always status -sb | sed "1 s,$, => $remote_url,"
  else
    ls --almost-all --no-group --human-readable --classify -g -1 --group-directories-first --color
  fi
}


alias j='__jump_directories'
alias ls='\gls --color=always'
alias ll='\gls --almost-all --no-group --human-readable --classify -g -1 --group-directories-first --color'

# Git common commands
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gls='git ls'
alias gd='git diff'
alias gdw='git diff --ignore-all-space'
alias gdc='git diff --cached'
alias gdwc='git diff --ignore-all-space --cached'

alias __git_branch='git rev-parse --abbrev-ref HEAD'
alias __git_remote='git config branch.`__git_branch`.remote'
alias __git_remote_url='git config remote.`__git_remote`.url'

alias github='__open_github'

alias z-copy-one-line-escaped='head -1 | xargs -r -i printf %q "{}" | tee /dev/tty | pbcopy'

alias xx=exit
alias vssh='vagrant ssh'

alias z-killthem='awk "{print \$1}" | xargs -pr kill -9'

alias z-remove-colors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias z-notify="say 'finished!'"
alias z-remove-dsstore='find -name .DS_Store -type f | xargs -i rm "{}"'

# Fix vim misspelled
alias Vim=vim
alias VIm=vim
alias VIM=vim

# Quick edits
alias vimrc='vim ~/.vim/vimrc'
alias valias='vim ~/.config/alias'

alias dri='docker run -i -t -P'
alias drd='docker run -d -P'
alias repush="git commit --amend --no-edit && git push --force && lb"

## Aliases rm to trash & cask if installed
hash trash 2>/dev/null && alias rm='trash'
hash brew  2>/dev/null && alias cask="brew cask"

function vima() {
  vim `git show --name-only --diff-filter=d --pretty= $1`
}

################
# Source Files #
################

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Adds a git remote,
# $1 = remote name
# $2 = replaces :repo_name/ => :$2/
addremote () {
    if [ $# -lt 1 ]; then
      echo "You need to specify the remote name."
      echo "$0 origin_name [repo]"
      return 1
    fi

    new_remote=$1
    new_repo=$1

    if [ "$2" != "" ]; then
        new_repo=$2
    fi

    remote_url=`git ls-remote --get-url`
    new_remote_url=`echo $remote_url | sed "s/:.*\?\//:$new_repo\//"`
    git remote add "$new_remote" "$new_remote_url"

    if [ $? -eq 0 ]; then
        git remote -v
    fi
}

export PYENV_ROOT="$HOME/.pyenv"
if hash pyenv 2>/dev/null; then
  python_init() {
    unalias pyenv
    unalias python
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  }

  pyenv_lazy() {
    python_init
    pyenv $@
  }

  python_lazy() {
    python_init
    python $@
  }

  alias pyenv=pyenv_lazy
  alias python=python_lazy
fi
# }}} Pyenv Configuration #

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export FZF_DEFAULT_OPTS="--extended --reverse --multi --cycle\
  --preview-window=down:30% \
  --ansi +s\
  --bind=ctrl-n:toggle-down\
  --color=fg:8,fg+:-1,bg:-1,bg+:-1,hl:0,hl+:3,prompt:2,marker:2,pointer:2,info:9"

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  export PATH=$NVM_DIR/versions/node/global/bin:$PATH
  export MANPATH=$NVM_DIR/versions/node/global/share/man:$MANPATH
fi

hash go 2>/dev/null && export GOPATH="$HOME/.config/go"

[ ! -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"
[ -f $HOME/.cfg/prompt.zsh ] && source ~/.cfg/prompt.zsh

# Load local zshrc
eval `dircolors -b ~/.cfg/dircolors.theme`

colors
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format "%B$fg[yellow]# %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:  %d"
zstyle ':completion:*' expand prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Ignore case in matchings:

autoload -Uz compinit
compinit

[ -f $HOME/.local/zshrc ] && source "$HOME/.local/zshrc"
[ -f $HOME/.dev_profile ] && source "$HOME/.dev_profile"

stty sane
