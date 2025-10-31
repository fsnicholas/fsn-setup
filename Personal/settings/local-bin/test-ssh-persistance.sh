#!/bin/bash
echo "=== SSH Agent Persistence Test ==="
echo "SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
echo "Keys loaded: $(ssh-add -l | wc -l)"
echo "Agent PID: $(pgrep ssh-agent)"
echo "Socket exists: $(test -S "$SSH_AUTH_SOCK" && echo "YES" || echo "NO")"
echo "Test connection: $(ssh -o ConnectTimeout=1 -T git@github.com 2>&1 | head -1)"

