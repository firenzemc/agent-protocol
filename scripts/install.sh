#!/usr/bin/env bash
# Install agent-protocol into the current project as a one-time snapshot.
#
# Copies the current protocol into the instruction file each tool reads.
# This is a SNAPSHOT, not a live link: the files won't auto-update — re-run
# to refresh. The script writes only those instruction files; it never
# creates a .gitignore or any other scaffolding.
#
# Usage:
#   # all supported tools
#   curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash
#
#   # only the tools you use
#   curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash -s -- claude cursor
#
# Tool keys: claude, agents, cursor, copilot, windsurf (default: all)
# Optional:  design (writes design.md), deploy (writes deployment.md)
#            — neither is included in the default set
set -euo pipefail

repo="${AGENT_PROTOCOL_REPO:-firenzemc/agent-protocol}"
ref="${AGENT_PROTOCOL_REF:-main}"
protocol_raw="https://raw.githubusercontent.com/${repo}/${ref}/AGENT_PROTOCOL.md"
design_raw="https://raw.githubusercontent.com/${repo}/${ref}/design.md"
deployment_raw="https://raw.githubusercontent.com/${repo}/${ref}/deployment.md"

# Map a tool key to the file that tool reads. `case` keeps this portable to
# the bash 3.2 that ships on macOS (no associative arrays).
dest_for() {
  case "$1" in
    claude)   echo "CLAUDE.md" ;;
    agents)   echo "AGENTS.md" ;;
    cursor)   echo ".cursor/rules/main.mdc" ;;
    copilot)  echo ".github/copilot-instructions.md" ;;
    windsurf) echo ".windsurfrules" ;;
    design)   echo "design.md" ;;
    deploy)   echo "deployment.md" ;;
    *)        return 1 ;;
  esac
}

tools=("$@")
if [ "${#tools[@]}" -eq 0 ]; then
  tools=(claude agents cursor copilot windsurf)
fi

# Lazy-fetch each source only once, and only when needed.
protocol="" design="" deployment=""

for tool in "${tools[@]}"; do
  if ! target="$(dest_for "$tool")"; then
    echo "unknown tool: $tool (valid: claude agents cursor copilot windsurf design deploy)" >&2
    exit 1
  fi

  if [ "$tool" = "design" ]; then
    [ -z "$design" ] && design="$(curl -fsSL "$design_raw")"
    content="$design"
  elif [ "$tool" = "deploy" ]; then
    [ -z "$deployment" ] && deployment="$(curl -fsSL "$deployment_raw")"
    content="$deployment"
  else
    [ -z "$protocol" ] && protocol="$(curl -fsSL "$protocol_raw")"
    content="$protocol"
  fi

  mkdir -p "$(dirname "$target")"
  printf '%s\n' "$content" > "$target"
  echo "wrote $target"
done

echo "done — snapshot of ${repo}@${ref}"
