# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

DISABLE_AUTO_TITLE="true"

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Deleting up to the previous slash with ctrl-w
autoload -U select-word-style
select-word-style bash
# End of lines added by compinstall
# Lines configured by zsh-newuser-install

# History
HISTFILE=~/.local/tmp/zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

unsetopt nomatch

export KEYTIMEOUT=1
bindkey -e

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export SHELL=$(which zsh)

# .zshrc
autoload -U promptinit && promptinit
prompt pure

# Mac Keyboard - I hope it will work for most keyboards
bindkey    "^[[1~"          beginning-of-line
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey    "^[[4~"          end-of-line
bindkey    "^[[5~"          up-line-or-search
bindkey    "^[[6~"          down-line-or-search
bindkey    "^[[1;9D"        backward-word
bindkey    "^[[1;9C"        forward-word

# Ctrl-X E / Ctrl-X Ctrl-E to edit command in Vi
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe'  edit-command-line
bindkey '^x^e' edit-command-line

# stop control flow, gimme ctrl-s back
stty -ixon

jobscount() {
  local jobs=$(jobs | grep ^\\\[ | wc -l)
  ((jobs)) && echo -n "${jobs} "
}

PROMPT='$(jobscount)'$PROMPT

[ -f $HOME/.local/zshrc      ] && source "$HOME/.local/zshrc"

[ -f $HOME/.cfg/sourcefile ] && source "$HOME/.cfg/sourcefile"
[ -f $HOME/.local/sourcefile  ] && source "$HOME/.local/sourcefile"

[ -f $HOME/.cfg/alias ] && source "$HOME/.cfg/alias"
[ -f $HOME/.local/alias  ] && source "$HOME/.local/alias"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.dev_profile
