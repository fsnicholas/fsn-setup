# ~/.config/zsh/.zprofile rewrite for systemd ssh-agent
# Connect to Systemd SSH Agent and Trigger Startup
# FSN: has to be in zsh directory set in .zshenv

# see /home/nicholas/.config/environment.d/
#export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# Connect the shell to the persistent ssh-agent socket managed by Systemd.
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Load keys that have been explicitly added/saved, though 'AddKeysToAgent yes' in ~/.ssh/config 
# should handle most cases on first use.
ssh-add -l > /dev/null 2>&1 || ssh-add

