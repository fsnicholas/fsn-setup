# ~/.config/zsh/.completion.zsh
# FSN completion V4c - Optimized for oh-my-posh

# Load more completions
fpath=($ZDOTDIR/plugins $fpath)

# +---------+
# | Options |
# +---------+

setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt COMPLETE_IN_WORD     # Complete from both ends of a word
setopt AUTO_LIST            # Automatically list choices on ambiguous completion
setopt LIST_PACKED          # More compact completion lists
setopt GLOB_COMPLETE        # Show completion for globs
setopt COMPLETE_ALIASES     # Complete aliases

# +---------+
# | zstyles |
# +---------+

# Modern completion styles
zstyle ':completion:*' completer _extensions _complete _approximate _ignored
zstyle ':completion:*' complete true
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true

# Smart case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Cache configuration
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Aliases expansion
zle -C alias-expension complete-word _generic
bindkey '^A' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias
zstyle ':completion:*' complete true

# Menu and colors
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Directory completion
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' keep-prefix true

# Enhanced formatting
zstyle ':completion:*:corrections' format '%F{green}→ %d (%e)%f'
zstyle ':completion:*:descriptions' format '%F{blue}💡 %d%f'
zstyle ':completion:*:messages' format '%F{magenta}💬 %d%f'
zstyle ':completion:*:warnings' format '%F{red}🚫 no matches found%f'

# Grouping and sorting
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# Process completion
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# SSH/SCP completion
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# URL globber
zstyle ':urlglobber' url-other-schema

zstyle :compinstall filename "$ZDOTDIR/.completion.zsh"

# Git optimization
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# File previews
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat ${(Q)realpath}'

# FZF-Tab optimization with better previews
zstyle ':fzf-tab:*' fzf-flags --height=80% --layout=reverse --border --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath 2>/dev/null || ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath 2>/dev/null || ls --color $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath 2>/dev/null || ls --color $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:*' fzf-flags --height=80% --layout=reverse --border --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'

# On-demand rehash
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

# fix issues with z for complete_aliases (after autoload)
compdef _zshz ${ZSHZ_CMD:-${_Z_CMD:-z}}