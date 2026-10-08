#!/usr/bin/env bash
# Build the web app with trunk and serve it using Python's http.server
# Usage: ./web-start.sh [PORT]
# Default port: 8765

set -e

PORT="${1:-8765}"

# Check for trunk
if ! command -v trunk >/dev/null 2>&1; then
    echo "Error: trunk is required. Install with: cargo install trunk --locked"
    exit 1
fi

# Build the web app
cd "$(dirname "${BASH_SOURCE[0]}")/apps/soundcraft-web"
echo "Building SoundCraft web app..."
trunk build --release

# Serve the built files
cd ../../dist/web
echo "Starting server on http://localhost:$PORT/"
echo "Press Ctrl+C to stop"
python3 -m http.server "$PORT"
