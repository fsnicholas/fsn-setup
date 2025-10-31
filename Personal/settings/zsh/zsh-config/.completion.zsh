# In ~/.completion.zsh

## FSN completion V4b - zinit
## 25-10-23


# Load more completions (this is where Zinit places its functions)
fpath=($ZDOTDIR/plugins $fpath)

# +---------+
# | Options |
# +---------+

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
# export LISTMAX=-1

zstyle ':completion:*:default' list-prompt   '%S%m%s'
zstyle ':completion:*:default' select-prompt '%S%m%s'

# +---------+
# | zstyles |
# +---------+

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate _ignored

# zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '+r:|[._-]=** r:|=** l:|=*'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

zstyle ':completion:*' original true

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C alias-expension complete-word _generic
bindkey '^A' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias


#For autocompletion with an arrow-key driven interface
# Allow you to select in a menu
#zstyle ':completion:*' menu select
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:functions' ignored-patterns '_*'   # don't offer to complete functions

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion:*' keep-prefix true

# don;t use this - error with fzf-completion. see the one in fzf-tab style
# zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# usl
zstyle ':urlglobber' url-other-schema

zstyle :compinstall filename "$ZDOTDIR/.completion.zsh"

# ---------------------------------------------------------------------------------------------
# FZF-TAB STYLES 
# ---------------------------------------------------------------------------------------------
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
#zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' fzf-flags --height=80% \
    --color=fg:240,fg+:15,info:green,prompt:green,pointer:yellow

# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

## end fzf-tab

#Typically, compinit will not automatically find new executables in the $PATH.
# For example, after you install a new package, the files in /usr/bin/
# would not be immediately or automatically included in the completion.

#On-demand rehash https://wiki.archlinux.org/index.php/Zsh
#zsh must be coaxed into rehashing its own command cache when it goes out of date
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

# Should be called before compinit
zmodload zsh/complist
# complete dotfile
_comp_options+=(globdots)   # Include hidden files.


# needed by zinit to cache completion
#zinit cdreplay -q

# fix issues with z for complete_aliases (after autoload)
compdef _zshz ${ZSHZ_CMD:-${_Z_CMD:-z}}

