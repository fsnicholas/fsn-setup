# FSN v3b - 2020-July-10
# FSN v3c - 2020-09-27 added DIFFPROG for pacdiff using meld
# FSN v3d - 2021-03-05 using node // cargo (for rust) // pk10 as per documentation
# FSN v3e - 2021-04-08 added stuff at end similar to neofetch
# FSN v3f - 2021-08-02 cleaned up different paths git installation
# FSN v4  - part of Garuda
# FSN v5 -  2021-Aug-18 total-rewrite for zsh completion & using zshenv
#           file now in ~/.config/zsh
# FSN v5a - Aug-20-2021 - more changes to setopt etc
# FSN v51 - Sept-05-2021 - added powerlevel10 at top
# FSN v52-debian - May-24-2022
# FSN v53-manjaro - July 17 2022
# FSN v54 changed history size & added MANPAGER using bat Aug 01 2022
# FSN v55 removed all pyenv and rust stuff Aug 07 2022
# FSN v56 only use pyenv and rust stuff if needed Aug 23 2022
# FSN v57 changed path to make bin before sbin  Sept 12 2022
# FSN v57a added bindkey ^U & ^Y (to be sane as bash) Sept 16 2022
# FSN v58  23-09-17 added fzf keybinds
# FSN v58a  23-09-20 has stuff for pyenv, rust, tilix
# FSN v58b  23-10-14 setopt lines formatted + numeric_glob_sort. new compdef for z (no garuda additions here)
# FSN v58c  23-11-06 added rust cargo to path
# FSN v58d  23-12-23 added export MANROFFOPT to fix manpage formatting
# FSN v58e  23-12-28 added git functionality with less, pager & git-aliases
# FSN v58f  24-10-18 sorted and added to setopt - navigation & hstory - from nixos settings

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

_comp_options+=(globdots) # With hidden files

# Load antigen plugin manager
source "$HOME/.antigen/bin/antigen.zsh"

# Load Antigen Configurations
# antigen init "$ZDOTDIR/.antigenrc"
antigen init "$HOME/.config/antigenrc"

# Completion -- load after sourcing plugins
source "$ZDOTDIR/.completion.zsh"


# +------------+
# | NAVIGATION |
# +------------+
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
setopt numeric_glob_sort        # Sort filenames numerically when it makes sense
setopt path_dirs			          # Automatically add PATH directories to cdpath
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

# autoload -Uz bd; bd

# +---------------+
# | HISTORY |
# +---------------+

export HISTSIZE=32768
export SAVEHIST=50000
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

# gives emacs style of line editing at the prompt = bindkey -e
# Set vim mode for zsh
bindkey -e

# use Ctrl-P to accept suggestion
bindkey '^P' autosuggest-accept

# FSN to search history up arrow or down arrow
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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

[[ -f "$ZDOTDIR/git-aliases" ]] && source  "$ZDOTDIR/git-aliases"

if [ -d "$HOME/.cargo/bin" ] ;
  then [[ -f "$ZDOTDIR/cargo-aliases" ]] && source  "$ZDOTDIR/cargo-aliases"
fi

[[ -f "$ZDOTDIR/.fzf.zsh" ]] && source  "$ZDOTDIR/.fzf.zsh"

# fsn added for pyenv
if [ -d "$HOME/.pyenv" ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  PATH="$PYENV_ROOT/bin:$PATH"
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# enable auto-activation of virtualenvs
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# for rust
# . "$HOME/.cargo/env"
[[ -f "$HOME/.cargo/env" ]] && source  "$HOME/.cargo/env"

# Key bindings
# ------------
source "/home/nicholas/.fzf/shell/key-bindings.zsh"

# fsn added for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# neofetch
