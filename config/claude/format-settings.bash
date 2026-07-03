#!/usr/bin/env bash
# Recursively sorts JSON object keys alphabetically so incidental key
# reordering doesn't create diff noise or merge conflicts when
# claude_settings.json is synced across machines. Run before committing
# changes to it.
set -euo pipefail

file="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/claude_settings.json"
tmp="$(mktemp)"
jq --sort-keys . "$file" > "$tmp"
cat "$tmp" > "$file"
rm -f "$tmp"
