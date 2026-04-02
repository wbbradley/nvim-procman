#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TS_QUERIES="${SCRIPT_DIR}/../../tree-sitter-procman/queries"
DEST="${SCRIPT_DIR}/../queries/procman"
if [[ ! -d "$TS_QUERIES" ]]; then
  echo "error: tree-sitter-procman not found at $TS_QUERIES" >&2
  echo "       expected sibling checkout at ../tree-sitter-procman" >&2
  exit 1
fi
cp "$TS_QUERIES"/*.scm "$DEST"/
echo "Synced queries from $TS_QUERIES → $DEST"
