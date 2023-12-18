 #!/usr/bin/zsh

# v1  for completion and using $ZDOTDIR
# v2 22-0818 - chnged the format of all the exports

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

### SETTING OTHER ENVIRONMENT VARIABLES
if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" 
export HISTFILE="${ZDOTDIR:-$HOME/.config/zsh}/.zhistory"

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
