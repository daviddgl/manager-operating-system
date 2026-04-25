# Copilot Instructions

This file points GitHub Copilot at the repo's canonical agent contract.

**Read [AGENTS.md](../AGENTS.md) first.** It is the single source of truth for any AI coding agent that edits, refactors, or contributes to this repository (Copilot, Claude Code, Cursor, Codex, Aider, etc.). Treat it as authoritative — if it conflicts with anything below, AGENTS.md wins.

## One distinction worth flagging up front

This repo serves two very different audiences. Don't confuse them:

- **Agents that *edit* this repo** (you, Copilot, when suggesting edits here) → follow [AGENTS.md](../AGENTS.md).
- **Agents that *load* this repo as a manager's knowledge base** (a ChatGPT Project, Gemini Gem, or Claude Project running MOS for an end-user manager) → bootstrapped via [`00_BOOT/bootstrap_prompt.md`](../00_BOOT/bootstrap_prompt.md), which loads [`05_COMMANDS/system_prompt.md`](../05_COMMANDS/system_prompt.md). That chain is for *operating* the OS, not *editing* it.

If you are suggesting code/markdown edits inside this repository, you are in the first group.
