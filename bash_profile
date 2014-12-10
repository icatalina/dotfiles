if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# The next line updates PATH for the Google Cloud SDK.
#source '/Users/icc/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
#source '/Users/icc/google-cloud-sdk/completion.bash.inc'


# Base16 Shell
export BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
