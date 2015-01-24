# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export BASE16=1
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

unsetopt nomatch

source ~/.dotfiles/zsh_keymaps

# .zshrc
autoload -U promptinit && promptinit
prompt pure

alias gdf='cdiff -w0 -s'
alias g='git'
alias gs='git st --'
alias gl='git log --'
alias gls='git ls --'
alias glss='git lss --'
alias gc='git commit --'
alias gaa='git add -A -- .'
alias ga='git add --'
alias aliasg='alias | grep git'
alias gdfw='git dfw'
alias gdf='git df'
alias gch='git checkout'
