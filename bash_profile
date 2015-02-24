if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# The next line updates PATH for the Google Cloud SDK.
#source '/Users/icc/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
#source '/Users/icc/google-cloud-sdk/completion.bash.inc'


# Base16 Shell
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

source ~/.dotfiles/exports
