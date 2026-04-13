# Agent Protocol

[English](./README.md) · [中文](./README.zh.md)

One shared set of rules for coding agents across Claude Code, Cursor, GitHub
Copilot, Windsurf, and any tool that reads `AGENTS.md`. Edit the rules in one
place; every tool picks them up.

## Why

If you use more than one AI coding tool, you've probably copy-pasted the same
guidelines into `CLAUDE.md`, `.cursorrules`, `.windsurfrules`,
`.github/copilot-instructions.md`, and so on. They drift. This repo keeps a
single source of truth in `core/` and points every tool-specific file at the
same concatenated output.

## Install

One-liner, run inside your project's root:

```bash
curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash
```

This writes `AGENT_PROTOCOL.md` and drops a copy at every path that a
supported tool expects:

| Tool           | File it reads                      |
| -------------- | ---------------------------------- |
| Claude Code    | `CLAUDE.md`                        |
| Generic agents | `AGENTS.md`                        |
| Cursor         | `.cursor/rules/main.mdc`           |
| GitHub Copilot | `.github/copilot-instructions.md`  |
| Windsurf       | `.windsurfrules`                   |

See [EXAMPLES.md](./EXAMPLES.md) for per-tool notes and real-world usage.

## Repo layout

```
core/                         ← single source of truth (edit these)
  00-principles.md            ← Karpathy 4 principles
  10-coding-style.md
  20-workflow.md
  30-communication.md
  40-stack-defaults.md
AGENT_PROTOCOL.md             ← concatenated build output
CLAUDE.md                     ← symlink → AGENT_PROTOCOL.md
AGENTS.md                     ← symlink → AGENT_PROTOCOL.md
.windsurfrules                ← symlink → AGENT_PROTOCOL.md
.cursor/rules/main.mdc        ← symlink → AGENT_PROTOCOL.md
.github/copilot-instructions.md ← symlink → AGENT_PROTOCOL.md
scripts/
  build.sh                    ← rebuild AGENT_PROTOCOL.md from core/
  install.sh                  ← one-liner installer for downstream projects
```

## Editing the rules

1. Edit the relevant file in `core/`.
2. Run `scripts/build.sh` to regenerate `AGENT_PROTOCOL.md`.
3. Commit both the source change and the rebuilt `AGENT_PROTOCOL.md`.

The symlinks don't need to be touched — they always point at
`AGENT_PROTOCOL.md`.

## What's inside

- **[00-principles.md](./core/00-principles.md)** — the four Karpathy
  principles: Think Before Coding, Simplicity First, Surgical Changes,
  Goal-Driven Execution.
- **[10-coding-style.md](./core/10-coding-style.md)** — match the codebase,
  naming, comments, types, errors.
- **[20-workflow.md](./core/20-workflow.md)** — plan → reproduce → small
  changes → verify → when stuck.
- **[30-communication.md](./core/30-communication.md)** — uncertainty,
  options, conciseness, honest progress reports.
- **[40-stack-defaults.md](./core/40-stack-defaults.md)** — sensible defaults
  when the project doesn't constrain the choice.

## License

MIT
