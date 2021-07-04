export CONFIG_ROOT="$(dirname $(realpath $HOME/.zshrc))"

setopt prompt_subst

autoload -U colors && colors
# Enable autocomplete (git, etc)
autoload -Uz compinit && compinit

stty werase undef

# Remove Last Login message
[ ! -f $HOME/.hushlogin ] && touch $HOME/.hushlogin

# Configure UZ plugin manager: https://github.com/maxrodrigo/uz
[ ! -d $HOME/.uz ] && git clone https://github.com/maxrodrigo/uz.git $HOME/.uz
source $HOME/.uz/uz.zsh

zadd ytet5uy4/fzf-widgets # fzf-insert-history
zadd zsh-users/zsh-syntax-highlighting
zadd icatalina/zsh-mini-prompt
zadd icatalina/zsh-keyboard-fixes
zadd icatalina/zsh-navi-plugin

export FZF_DEFAULT_OPTS="--reverse --height=50%"

bindkey '^r' fzf-insert-history
bindkey '^ ' navi_widget

# Colorize `ls`
eval `gdircolors -b $CONFIG_ROOT/theme.dircolors`

if [ -f "/usr/local/opt/asdf/asdf.sh" ]; then
    source /usr/local/opt/asdf/asdf.sh
else
    echo "Install asdf: brew install asdf"
fi

# Compile PHP without Postgre support.
# Postgre support requires an installed version of postgre.
export PHP_WITHOUT_PDO_PGSQL=yes

# Some dependencies (eg. node-sass), use the `npm_config_cache` variable to check for build artifacts.
# With Yarn, this variable is not define, this causes yarn install to rebuild the binaries on every
# install
export npm_config_cache=$HOME/.npm

# Set vim as the default editor
export EDITOR="$(which vim)"
export VISUAL="$EDITOR"

# Set zsh as the default SHELL
export SHELL="$(which zsh)"

export HISTSIZE=999999
export SIZEHIST="$HISTSIZE"

setopt HIST_IGNORE_SPACE        # Remove command lines from the history list when the first character on the line is a space
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks from each command line being added to the history list
setopt HIST_FIND_NO_DUPS        # When searching for history entries in the line editor, do not display duplicates
setopt HIST_IGNORE_ALL_DUPS     # If a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt HIST_NO_FUNCTIONS        # Remove function definitions from the history list.]
setopt SHARE_HISTORY            # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file
unsetopt INC_APPEND_HISTORY     # This needs to be off if SHARE_HISTORY is on

unsetopt NOMATCH                # If a pattern for filename generation has no matches, print an error

stty sane
stty -ixon -ixoff               # Disable ctrl-s/ctrl-q (scroll-lock)

# Highlight autocompletion menu
zstyle ':completion:*' menu select=2

alias rm='trash'
alias g="git"
alias gs="git status -sb"
alias gls="git ls"
alias ga="git add"
alias gd="git diff"
alias gdc="git diff --cached"

alias nssh='ssh -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no'

alias xx="exit"

# require gls (coreutils)
alias ls='\gls --color --classify --group-directories-first'
alias ll='\gls --almost-all --no-group --human-readable --classify -g -1 --group-directories-first --color'

export DISABLE_OPENCOLLECTIVE=true
export ADBLOCK=true

source ~/.dev_profile
