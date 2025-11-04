# FSN v3c - 2020-09-27 added DIFFPROG for pacdiff using meld
# FSN v54 changed history size & added MANPAGER using bat Aug 01 2022
# FSN v57a added bindkey ^U & ^Y (to be sane as bash) Sept 16 2022
# FSN v58  23-09-17 added fzf keybinds
# FSN v58b  23-10-14 setopt lines formatted + numeric_glob_sort. new compdef for z (no garuda additions here)
# FSN v58d  23-12-23 added export MANROFFOPT to fix manpage formatting
# FSN v59   25-10-23 for zinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# don't use 'url-quote-magic in oh-my-zsh/lib/misc.zsh
DISABLE_MAGIC_FUNCTIONS=true

# FSN resetting all path
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# ------------------------------------------------------------------------------------------------
# ZINIT & PLUGINS
# ------------------------------------------------------------------------------------------------
#source "$ZDOTDIR/.zinit-set.zsh"
# Load antigen plugin manager
source "$HOME/.antigen/bin/antigen.zsh"

# Load Antigen Configurations
# antigen init "$ZDOTDIR/.antigenrc"
antigen init "$HOME/.config/antigenrc"

# ------------------------------------------------------------------------------------------------
# ZSH COMPLETION SYSTEM (Run ONCE after plugins)
# ------------------------------------------------------------------------------------------------
autoload -Uz compinit && compinit

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
setopt auto_menu			          # Automatically show a menu of completion options
setopt auto_list			          # Automatically list all completions when there are multiple matches
setopt auto_param_slash			    # Automatically append a '/' after directory completions
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
setopt path_dirs			          # Automatically add PATH directories to cdpath
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
setopt bang_hist			           # Enable history expansion with the '!' (bang)
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

# Fix for HOME/END keys: Binds common terminal codes to Zsh functions
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# FIX for DELETE key (Delete character under cursor)
bindkey '^[[3~' delete-char-or-list 

# gives emacs style of line editing at the prompt
bindkey -e

# use Ctrl-P to accept suggestion (from zsh-autosuggestions)
bindkey '^P' autosuggest-accept

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

# +---------------------------+
# |    PATH                   +
# Custom binaries and scripts +
# +---------------------------+

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

# for pacdiff
export DIFFPROG='sudo meld'

export GIT_PAGER=bat

# Set an evaporating environment variable to use 'cat' for your pager
#GIT_PAGER=cat git diff

# Tells 'less' not to paginate if less than a page
export LESS="-F -X $LESS"

# Make nano the default editor
export EDITOR='nano'
export VISUAL='nano'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# needed for formatting MAN pages
export MANROFFOPT="-c"

# cheat supports enhanced autocompletion via integration with fzf
export CHEAT_USE_FZF=true

# Include aliases dotfile
# $ZDOTDIR -> $HOME/.config/zsh
[[ -f "$ZDOTDIR/.zsh-aliases" ]] && source  "$ZDOTDIR/.zsh-aliases"

#[[ -f "$ZDOTDIR/git-aliases" ]] && source  "$ZDOTDIR/git-aliases"

if [ -d "$HOME/.cargo/bin" ] ;
  then [[ -f "$ZDOTDIR/cargo-aliases" ]] && source  "$ZDOTDIR/cargo-aliases"
fi

# for rust
# . "$HOME/.cargo/env"
[[ -f "$HOME/.cargo/env" ]] && source  "$HOME/.cargo/env"

# fsn added for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# ------------------------------------------------------------------------------------------------
# FINAL EVALUATIONS (Functions and Keybindings)
# ------------------------------------------------------------------------------------------------
# Zoxide and FZF should be loaded before the prompt.
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"

#----------------------
#  fzf setup
#----------------------
[[ -f "$ZDOTDIR/.fzf.zsh" ]] && source "$ZDOTDIR/.fzf.zsh"
# Set up fzf key bindings and fuzzy completion (zsh)
source <(fzf --zsh)

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ------  end fzf setup

# fzf-tab
[[ -f "$HOME/.fzf-tab/fzf-tab.plugin.zsh" ]] && source  "$HOME/.fzf-tab/fzf-tab.plugin.zsh"

# Github CLI completion
eval "$(gh completion -s zsh)"

# ------------------------------------------------------------------------------------------------
# PROMPT CONFIGURATION (ABSOLUTE LAST)
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# ------------------------------------------------------------------------------------------------
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

