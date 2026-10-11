#!/usr/bin/env bash
# Runs once when the workspace is created: installs the Forge CLI and sets up the kitchen-* helpers.
set -euo pipefail

bin="$(cd "$(dirname "${BASH_SOURCE[0]}")/../bin" && pwd)"

npm install -g @forge/cli@latest

# The Forge manifest schema, so the editor checks manifest.yml as you type.
mkdir -p "$HOME/.forge-kitchen"
schema="$(find "$(npm root -g)/@forge/cli" -path '*@forge/manifest/out/schema/manifest-schema.json' -print -quit 2>/dev/null || true)"
[ -n "$schema" ] && cp "$schema" "$HOME/.forge-kitchen/manifest-schema.json"

# Every new terminal loads the login saved by kitchen-login, and kitchen-login updates the current one too.
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  [ -f "$rc" ] || continue
  grep -q '# Forge Kitchen' "$rc" && continue
  cat >>"$rc" <<RC

# Forge Kitchen
export PATH="\$PATH:$bin"
[ -f "\$HOME/.forge-login" ] && . "\$HOME/.forge-login"
kitchen-login() {
  "$bin/kitchen-login" "\$@" || return
  unset FORGE_EMAIL FORGE_API_TOKEN
  [ -f "\$HOME/.forge-login" ] && . "\$HOME/.forge-login"
  return 0
}
RC
done

forge --version
