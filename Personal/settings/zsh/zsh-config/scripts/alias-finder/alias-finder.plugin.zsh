# -----------------------------------------------------------------------------
# alias-finder.plugin.zsh (standalone version)
# -----------------------------------------------------------------------------
# Purpose:
#   Search for an alias that matches a given command or pattern.
#
# Usage:
#   alias-finder <command>
#   alias-finder git status
#
# Optional configuration via zstyle:
#   zstyle ':alias-finder' longer yes
#
# Notes:
#   - Does not depend on Oh My Zsh.
#   - Compatible with pure Zsh setups.
#   - Uses built-in `alias` command for lookup.
# -----------------------------------------------------------------------------

# Optional configuration flag (default: false)
local longer=false
zstyle -t ':alias-finder' longer && longer=true

alias-finder() {
  if (( $# == 0 )); then
    echo "Usage: alias-finder <command or pattern>"
    return 1
  fi

  local cmd="$*"
  local found=true

  # Search through defined aliases
  while IFS='=' read -r name definition; do
    definition="${definition#\'}"
    definition="${definition%\'}"

    if [[ "$longer" == true ]]; then
      # Match any part of the alias definition (longer search)
      if [[ "$definition" == *"$cmd"* ]]; then
        printf "%-20s = %s\n" "$name" "$definition"
        found=true
      fi
    else
      # Match start of definition only (faster, more precise)
      if [[ "$definition" == "$cmd"* ]]; then
        printf "%-20s = %s\n" "$name" "$definition"
        found=true
      fi
    fi
  done < <(alias)

  if [[ "$found" == false ]]; then
    echo "No alias found matching: $cmd"
    return 1
  fi
}

# -----------------------------------------------------------------------------
# Optional: register short alias
# -----------------------------------------------------------------------------
# alias af='alias-finder'
