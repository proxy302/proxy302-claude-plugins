#!/bin/bash
# Builds proxy302-skill.zip (the skill folder alone) for upload in Claude.ai / Claude Desktop.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
out="$PWD/dist/proxy302-skill.zip"
rm -f "$out"
(cd plugins/proxy302/skills && zip -qr -X "$out" proxy302)
unzip -l "$out"
