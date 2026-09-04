# ~/.config/zsh/.zshrc

# version for ubuntu 26.04
# not using powerlevel10, oh-my-posh or antigen

# 1. ENVIRONMENT VARIABLES (Exports)
if [ -d "$HOME/.profile.d" ]; then
    for file in "$HOME/.profile.d"/*.sh; do
        [ -r "$file" ] && source "$file"
    done
fi

# -----------------------------
# 2.  Zsh Options
# -----------------------------

# -----------------------------
# History Environment Variables
# -----------------------------
export HISTSIZE=32768
export SAVEHIST=50000
# Note: HISTORY_IGNORE requires EXTENDED_GLOB to work with regex-like patterns.
# I added 'z' to the ignore list since you just installed zoxide!
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|z)"

# -----------------------------
# Core Zsh Options (The Engine)
# -----------------------------
setopt AUTO_CD              # Type directory name to cd into it
setopt CDABLE_VARS          # cd into a variable containing a path (e.g., cd my_var)

# Directory Stack
setopt AUTO_PUSHD           # cd acts like pushd
setopt PUSHD_IGNORE_DUPS    # No duplicates in dir stack
setopt PUSHD_SILENT         # Don't print the stack after pushd/popd
setopt PUSHD_TO_HOME        # pushd with no args goes to HOME

# Globbing & Completion
setopt EXTENDED_GLOB        # Advanced pattern matching (needed for HISTORY_IGNORE)
setopt GLOB_DOTS            # Include hidden files (like .venv) in completions
setopt NO_CASE_GLOB         # Case-insensitive file matching

# Quality of Life
setopt INTERACTIVE_COMMENTS # Allow '#' comments in interactive shell
setopt NO_BEEP              # Stop the annoying terminal bell on errors
setopt IGNORE_EOF           # Prevent accidental exit with Ctrl+D

# -----------------------------
# History Options (The Memory)
# -----------------------------
setopt EXTENDED_HISTORY     # Save timestamp and elapsed time (great for Starship!)
setopt SHARE_HISTORY        # Share history across all open terminals instantly

# Deduplication (The "Set" logic for history)
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicates if a new one is entered
setopt HIST_FIND_NO_DUPS    # When searching history, skip duplicates
setopt HIST_SAVE_NO_DUPS    # Don't save duplicates to the history file

# Safety & Cleanup
setopt HIST_IGNORE_SPACE    # Ignore commands starting with a space (hide passwords!)
setopt HIST_REDUCE_BLANKS   # Remove extra spaces from commands
setopt HIST_VERIFY          # Show what !command will do before executing it

# -----------------------------
# 3 Completion System (The Brain)
# -----------------------------

# Add zsh-completions to the function search path
fpath=("$HOME/.config/zsh/plugins/zsh-completions/src"  $fpath )

autoload -Uz compinit
# Only run compinit once a day to speed up shell startup
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

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


### add aliases
# Include aliases dotfile
# $ZDOTDIR -> $HOME/.config/zsh
[[ -f "$ZDOTDIR/.zsh-aliases" ]] && source  "$ZDOTDIR/.zsh-aliases"



# -----------------------------
# 4 Tools
# -----------------------------

# Zoxide (Smarter cd)

eval "$(zoxide init zsh)"

# -----------------------------
# 5. PLUGINS (fzf, autosuggestions)
# -----------------------------

# -----------------------------
# fzf-tab
# Must be loaded after compinit
# -----------------------------
source "$HOME/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"

# Ubuntu's fzf package
if [[ -r /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -r /usr/share/doc/fzf/examples/completion.zsh ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# fzf-tab configuration
zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse --border
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -la --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -la --color=always $realpath'

# -----------------------------
# Autosuggestions
# -----------------------------
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Optional autosuggestion settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# -----------------------------
# 6 Starship prompt
# -----------------------------

eval "$(starship init zsh)"

# -----------------------------
# 7. KEYBINDINGS (Custom shortcuts)
# -----------------------------
# Smart history search with Up/Down arrows
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search


# --- PLUGINS ---
# -----------------------------
# Syntax highlighting
# last plugin loaded
# -----------------------------
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
