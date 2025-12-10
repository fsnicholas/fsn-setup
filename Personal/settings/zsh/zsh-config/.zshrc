# ~/.config/zsh/.zshrc

# ------------------------------------------------------------------------------------------------
# OH-MY-POSH SETUP (Must be before antigen)
# ------------------------------------------------------------------------------------------------
# Setup oh-my-posh config directory
export OH_MY_POSH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ohmyposh/power10-rain.toml"

# Initialize oh-my-posh
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh init zsh --config $OH_MY_POSH_CONFIG)"
fi

# ------------------------------------------------------------------------------------------------
# ZINIT & PLUGINS
# ------------------------------------------------------------------------------------------------

# Load antigen plugin manager
source "$HOME/.antigen/bin/antigen.zsh"

# Load Antigen Configurations
antigen init "$HOME/.config/antigenrc"

# ------------------------------------------------------------------------------------------------
# ZSH COMPLETION SYSTEM (Run ONCE after plugins)
# ------------------------------------------------------------------------------------------------
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# ------------------------------------------------------------------------------------------------
# COMPLETION SETTINGS
# Load custom completion styles and settings.
# ------------------------------------------------------------------------------------------------
source "$ZDOTDIR/.completion.zsh"

# allows advanced Zsh themes, customizations to work correctly
setopt promptsubst 

# ------------------------------------------------------------------------------------------------
# NAVIGATION 
# ------------------------------------------------------------------------------------------------
setopt always_to_end            # when completing from middle of word, move the cursor to end of word
setopt auto_cd                  # if cmd is directory than cd to that directory
setopt auto_menu                # Automatically show a menu of completion options
setopt auto_list                # Automatically list all completions when there are multiple matches
setopt auto_param_slash         # Automatically append a '/' after directory completions
setopt auto_pushd               # make cd push old dir in dir stack
setopt cd_able_vars             # Change directory to a path stored in a variable.
setopt complete_aliases         # complete alisases
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt correct_all
setopt extended_glob            # Use extended globbing syntax.
setopt glob_dots                # Enable globbing to match dotfiles (hidden files) - show them
setopt hash_list_all            # hash everything before completion
setopt interactive_comments     # Make commenting with '#' work
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt no_case_glob             # globbing and tab-completion to be case-insensitive
setopt no_nomatch               # nonomatch means wildcard * works - does this globally like in bash
setopt notify                   # prints background job completion messages immediately
setopt numeric_glob_sort        # Sort filenames numerically when it makes sense
setopt path_dirs                # Automatically add PATH directories to cdpath
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

# ------------------------------------------------------------------------------------------------
# HISTORY 
# ------------------------------------------------------------------------------------------------
export HISTSIZE=32768
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZDOTDIR/.zhistory
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
setopt bang_hist                 # Enable history expansion with the '!' (bang)
setopt extended_history          # write the history file in the ':start:elapsed;command' format.
setopt hist_expire_dups_first    # expire a duplicate event first when trimming history.
setopt hist_find_no_dups         # do not display a previously found event.
setopt hist_ignore_all_dups      # delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups          # do not record an event that was just recorded again.
setopt hist_ignore_space         # do not record an event starting with a space.
setopt hist_reduce_blanks        # remove superfluous blanks from command
setopt hist_save_no_dups         # do not write a duplicate event to the history file.
setopt hist_verify               # do not execute immediately upon history expansion.
setopt inc_append_history        # append to the history immediately, not when the shell exits
setopt share_history             # share history between all sessions.
### end history

##  Autoload
autoload -U colors && colors

(( $+aliases[run-help] )) && unalias run-help
autoload -Uz run-help
alias help=run-help

autoload run-help-git
autoload run-help-sudo

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# ----------------------------------------------------------------------
# MANUAL KEY BINDINGS & FUNCTIONS
# ----------------------------------------------------------------------

# gives emacs style of line editing
bindkey -e

bindkey '^[[H' beginning-of-line  # HOME key
bindkey '^[[F' end-of-line        # END key
bindkey '^[[3~' delete-char-or-list # DELETE key
bindkey '^[[2~' overwrite-mode

bindkey '^P' autosuggest-accept
bindkey '^ ' autosuggest-accept           # Ctrl+Space to accept
bindkey '^F' autosuggest-accept           # Ctrl+F to accept  
bindkey '^[^M' autosuggest-execute        # Alt+Enter to execute
bindkey '^[^H' autosuggest-clear          # Alt+Backspace to clear

# FSN to search history up arrow or down arrow (from zsh-history-substring-search)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Standard history search (Emacs bindings)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# FSN bind Ctrl-U to delete from cursor to beginning of line - same as bash & ^Y to undo
bindkey '^U' backward-kill-line
bindkey '^Y' undo

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Autosuggestion Configuration
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=1        # Async for performance
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1    # Better performance with oh-my-posh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # Gray suggestions works with OMP

# Syntax highlighting
export FAST_HIGHLIGHT[use_async]=1
export FAST_HIGHLIGHT[use_brackets]=1
# Customize colors if needed (works with most themes)
export FAST_HIGHLIGHT[chroma-git]="chroma/-ogit.ch"  # Enhanced git highlighting

# +---------------------------+
# |    PATH                   +
# Custom binaries and scripts +
# +---------------------------+

# Reset PATH for clean management
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

export DIFFPROG='sudo meld'    # for pacdiff
export GIT_PAGER=bat
export LESS="-F -X $LESS"   # no paginate if less than page
export EDITOR='nano'
export VISUAL='nano'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"     # for formatting MAN pages
export CHEAT_USE_FZF=true  # cheat enhanced autocompletion with fzf

# Include aliases dotfile
# $ZDOTDIR -> $HOME/.config/zsh
[[ -f "$ZDOTDIR/.zsh-aliases" ]] && source  "$ZDOTDIR/.zsh-aliases"

[[ -f "$ZDOTDIR//scripts/zsh-uv-functions" ]] && source  "$ZDOTDIR/scripts/zsh-uv-functions"

if [ -d "$HOME/.cargo/bin" ] ;
  then [[ -f "$ZDOTDIR/cargo-aliases" ]] && source  "$ZDOTDIR/cargo-aliases"
fi

# for rust
[[ -f "$HOME/.cargo/env" ]] && source  "$HOME/.cargo/env"

# fsn added for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# ------------------------------------------------------------------------------------------------
# FINAL EVALUATIONS (Functions and Keybindings)
# ------------------------------------------------------------------------------------------------

# Zoxide and FZF should be loaded before the prompt.
eval "$(zoxide init zsh)"

#----------------------
#  fzf setup
#----------------------
[[ -f "$ZDOTDIR/.fzf.zsh" ]] && source "$ZDOTDIR/.fzf.zsh"

# Set up fzf key bindings and fuzzy completion (zsh)
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ------  end fzf setup

# fzf-tab (if manually installed)
[[ -f "$HOME/.fzf-tab/fzf-tab.plugin.zsh" ]] && source  "$HOME/.fzf-tab/fzf-tab.plugin.zsh"

# Github CLI completion
if command -v gh >/dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi

source /home/nicholas/.config/broot/launcher/bash/br


