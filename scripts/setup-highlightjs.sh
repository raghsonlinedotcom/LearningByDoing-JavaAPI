#!/usr/bin/env bash
set -euo pipefail

# Choose a pinned version for stability
HL_VERSION="11.9.0"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASSET_DIR="$ROOT_DIR/assets/highlightjs"
STYLE_DIR="$ASSET_DIR/styles"

mkdir -p "$STYLE_DIR"

echo "Downloading Highlight.js v$HL_VERSION..."
curl -Ls "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/highlight.min.js" \
  -o "$ASSET_DIR/highlight.min.js"

# Dark + Light themes
curl -Ls "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/styles/github-dark.min.css" \
  -o "$STYLE_DIR/github-dark.min.css"
curl -Ls "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/styles/github.min.css" \
  -o "$STYLE_DIR/github.min.css"

echo "✅ Highlight.js saved under assets/highlightjs/"
echo "   - JS: assets/highlightjs/highlight.min.js"
echo "   - CSS (dark): assets/highlightjs/styles/github-dark.min.css"
echo "   - CSS (light): assets/highlightjs/styles/github.min.css"

