#!/bin/bash

set -e

if [[ $# -eq 3 ]]; then
	BRANCH_FLAG="$1"
	BRANCH_NAME="$2"
	WORKTREE_PATH="$3"

	git worktree add "$BRANCH_FLAG" "$BRANCH_NAME" "$WORKTREE_PATH"
	ROOT_PATH=$(realpath "$WORKTREE_PATH")
fi

if [[ $# -eq 1 ]]; then

	BRANCH_NAME="$1"

	git worktree add "$BRANCH_NAME"
	ROOT_PATH=$(realpath "$BRANCH_NAME")
fi

if [[ $# -eq 2 ]]; then

	BRANCH_NAME="$1"

	git worktree add "$BRANCH_FLAG" "$BRANCH_NAME"
	ROOT_PATH=$(realpath "$BRANCH_NAME")
fi

if [[ "$BRANCH_NAME" == *"/"* ]]; then
	SAFE_BRANCH_NAME=$(echo "$BRANCH_NAME" | tr '/' '-')
else
	SAFE_BRANCH_NAME="$BRANCH_NAME"
fi

WORKTREE_NAME="$SAFE_BRANCH_NAME"
TMUXINATOR_CONFIG_DIR="$HOME/dotfiles/modules/tmuxinator/tmuxinator"
TMUX_CONFIG_FILE="$TMUXINATOR_CONFIG_DIR/$WORKTREE_NAME.yml"
TEMPLATE_FILE="$HOME/dotfiles/modules/git/scripts/tmuxinator_base.yaml"

sed -e "s|__NAME__|$SAFE_BRANCH_NAME|g" \
	-e "s|__ROOT__|$ROOT_PATH|g" \
	"$TEMPLATE_FILE" >"$TMUX_CONFIG_FILE"

echo "Tmuxinator project created: $TMUX_CONFIG_FILE"
tmuxinator start "$WORKTREE_NAME"
