#!/usr/bin/env bash
# Install agent-protocol into the current project.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash
#
# Writes AGENT_PROTOCOL.md and copies it to the file each tool expects:
#   CLAUDE.md, AGENTS.md, .windsurfrules,
#   .cursor/rules/main.mdc, .github/copilot-instructions.md
set -euo pipefail

repo="${AGENT_PROTOCOL_REPO:-firenzemc/agent-protocol}"
ref="${AGENT_PROTOCOL_REF:-main}"
raw="https://raw.githubusercontent.com/${repo}/${ref}/AGENT_PROTOCOL.md"

curl -fsSL "$raw" -o AGENT_PROTOCOL.md

mkdir -p .cursor/rules .github
for target in \
  CLAUDE.md \
  AGENTS.md \
  .windsurfrules \
  .cursor/rules/main.mdc \
  .github/copilot-instructions.md
do
  cp AGENT_PROTOCOL.md "$target"
done

echo "installed agent-protocol (${repo}@${ref})"
