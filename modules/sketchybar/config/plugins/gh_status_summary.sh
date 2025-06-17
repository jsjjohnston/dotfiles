#!/usr/bin/env bash

ORG="montuGroup"
NAME="git"

total=$(gh repo list "$ORG" --limit 100 --json nameWithOwner -q '.[].nameWithOwner' |
        xargs -n1 -P10 -I{} bash -c '
    repo="{}"
    count=$(gh pr list --repo "$repo" --author @me --state open --json number 2>/dev/null | jq length)
    echo $count
  ' | awk '{s+=$1} END {print s}')

# Ensure $NAME is defined before using it with sketchybar
sketchybar --set "$NAME" label="PRS: $total"
