# Agent Protocol

[English](./README.md) · [中文](./README.zh.md)

一份适用于多种 AI 编码工具的统一规则集：Claude Code、Cursor、GitHub Copilot、
Windsurf，以及任何读取 `AGENTS.md` 的工具。只在一个地方维护规则，所有工具
自动生效。

## 为什么需要它

如果你同时使用多个 AI 编码工具，很可能已经把同一份规则复制粘贴到
`CLAUDE.md`、`.cursorrules`、`.windsurfrules`、`.github/copilot-instructions.md`
等文件里。它们很容易不一致。本仓库把唯一真源（single source of truth）放在
`core/` 目录下，所有工具专用的文件都指向同一份拼接后的输出。

## 安装

在你的项目根目录执行下面这行命令：

```bash
# 安装全部工具
curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash

# 只安装你实际用到的工具
curl -fsSL https://raw.githubusercontent.com/firenzemc/agent-protocol/main/scripts/install.sh | bash -s -- claude cursor
```

脚本会**一次性快照**当前版本的 protocol，写入每个工具期望的路径。文件不会自动
更新——重新运行即可刷新。脚本不会创建 `.gitignore`、不使用符号链接、不产生额外
脚手架文件。

| 工具 key     | 写入的文件                           |
| ------------ | ------------------------------------ |
| `claude`     | `CLAUDE.md`                          |
| `agents`     | `AGENTS.md`                          |
| `cursor`     | `.cursor/rules/main.mdc`             |
| `copilot`    | `.github/copilot-instructions.md`    |
| `windsurf`   | `.windsurfrules`                     |

更多针对每种工具的使用示例见 [EXAMPLES.md](./EXAMPLES.md)。

## 仓库结构

```
core/                         ← 唯一真源（只编辑这里）
  00-principles.md            ← Karpathy 四条原则
  10-coding-style.md
  20-workflow.md
  30-communication.md
  40-stack-defaults.md
AGENT_PROTOCOL.md             ← 拼接后的输出
CLAUDE.md                     ← 符号链接 → AGENT_PROTOCOL.md
AGENTS.md                     ← 符号链接 → AGENT_PROTOCOL.md
.windsurfrules                ← 符号链接 → AGENT_PROTOCOL.md
.cursor/rules/main.mdc        ← 符号链接 → AGENT_PROTOCOL.md
.github/copilot-instructions.md ← 符号链接 → AGENT_PROTOCOL.md
scripts/
  build.sh                    ← 从 core/ 重新生成 AGENT_PROTOCOL.md
  install.sh                  ← 面向下游项目的一行安装脚本
```

## 如何修改规则

1. 编辑 `core/` 下对应的文件。
2. 运行 `scripts/build.sh`，重新生成 `AGENT_PROTOCOL.md`。
3. 把源文件和重新生成的 `AGENT_PROTOCOL.md` 一起提交。

符号链接不需要修改，它们始终指向 `AGENT_PROTOCOL.md`。

## 规则内容

- **[00-principles.md](./core/00-principles.md)** — Karpathy 四条原则：
  先思考再写代码、简单优先、外科手术式修改、目标驱动执行。
- **[10-coding-style.md](./core/10-coding-style.md)** — 匹配已有代码风格、
  命名、注释、类型、错误处理。
- **[20-workflow.md](./core/20-workflow.md)** — 计划 → 复现 → 小步修改 →
  验证 → 遇到阻塞时的处理方式。
- **[30-communication.md](./core/30-communication.md)** — 表达不确定性、
  呈现多种选项、保持简洁、诚实汇报进度。
- **[40-stack-defaults.md](./core/40-stack-defaults.md)** — 当项目没有限定
  技术栈时的默认选择。

## 许可证

MIT
