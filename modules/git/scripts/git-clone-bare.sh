#!/bin/bash

set -e

git clone --bare "$1"

REPO_NAME=$(basename "$1" .git)
REPO_DIR="$PWD/$REPO_NAME.git"

TMUXINATOR_CONFIG_DIR="$HOME/dotfiles/modules/tmuxinator/tmuxinator"
TMUX_CONFIG_FILE="$TMUXINATOR_CONFIG_DIR/$REPO_NAME.yml"
TEMPLATE_FILE="$HOME/dotfiles/templates/tmuxinator_base.yaml"

mkdir -p "$TMUXINATOR_CONFIG_DIR"

# Replace placeholders in YAML template
sed "s|{{NAME}}|$REPO_NAME|g; s|{{ROOT}}|$REPO_DIR|g" "$TEMPLATE_FILE" >"$TMUX_CONFIG_FILE"

echo "Tmuxinator project created: $TMUX_CONFIG_FILE"
tmuxinator start "$REPO_NAME"
