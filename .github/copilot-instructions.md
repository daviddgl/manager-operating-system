# Copilot Instructions — Manager Operating System (MOS)

> **Full agent contract:** [AGENTS.md](../AGENTS.md). It is the single source of truth and overrides anything below if they conflict. The condensed rules in this file exist because some Copilot surfaces (github.com Copilot Chat / Code Review, certain IDE integrations) only inject `.github/copilot-instructions.md` and may not load `AGENTS.md`. Keep this file in sync with AGENTS.md when load-bearing rules change.

## What this repo is (in one paragraph)

This repository is a **Manager Operating System (MOS)** — a portable, markdown-based decision-support framework for engineering managers. It is **not a code project**. Every file is structured Markdown designed to be uploaded into AI copilots (ChatGPT Projects, Gemini Gems, Claude Projects) as knowledge files. The only executable is [`scripts/bundle.sh`](../scripts/bundle.sh). The repo is **public and MIT-licensed** — all content must remain company-agnostic and reusable. After first mention, "Manager Operating System" is abbreviated **MOS**.

## Two audiences (do not confuse)

- **Agents that *edit* this repo** (you, when suggesting edits) → follow these rules and [AGENTS.md](../AGENTS.md).
- **Agents that *load* MOS as a manager's knowledge base** (an end-user's ChatGPT/Gemini/Claude project) → bootstrapped via [`00_BOOT/bootstrap_prompt.md`](../00_BOOT/bootstrap_prompt.md), which loads [`05_COMMANDS/system_prompt.md`](../05_COMMANDS/system_prompt.md). That chain operates the OS for an end-user — it is not for editing the repo.

## Repository layout (do not rename, renumber, or flatten)

| Folder | Layer | Lifecycle | Portable? |
|--------|-------|-----------|-----------|
| `00_BOOT/` | System manual | Permanent | n/a |
| `01_KERNEL/` | Philosophy, decision protocols, Personal DNA | Permanent | **Yes — travels with manager** |
| `02_CONFIG/` | Company mission, values, strategy | Per-company | No |
| `03_DRIVERS/` | Team OS, player cards | Per-team | No |
| `04_PROCESSES/` | Tactical plan, current quarter | Per-quarter | No |
| `05_COMMANDS/` | Named AI commands + master `system_prompt.md` | Permanent | **Yes** |
| `06_BOARDROOM/` | Advisory council personas | Permanent | **Yes** |

## Load-bearing rules (the ones that prevent silent breakage)

1. **Logic vs. Data separation.** Templates contain *how* decisions are made — never live task data, real names, real metrics, internal URLs, or company-specific content. Use `[bracket]` placeholders for user-specific content and `<!-- HTML comments -->` for inline guidance.
2. **Portability contract.** `01_KERNEL/`, `05_COMMANDS/`, and `06_BOARDROOM/` must stay generic and backward-compatible. `02_CONFIG/` is per-company. `03_DRIVERS/` and `04_PROCESSES/` are replaced when team/quarter changes.
3. **Never renumber MOS sections.** [`01_KERNEL/manager_operating_system.md`](../01_KERNEL/manager_operating_system.md) uses §1–§13. Add new sections at the end (§14, §15…) and document via CHANGELOG. Renumbering breaks every cross-reference in commands, the Decision Protocol, and the System Prompt.
4. **CHANGELOG before commit (critical).** Every framework change MUST be documented in [`CHANGELOG.md`](../CHANGELOG.md) under `[Unreleased]` (`### Added` / `### Changed` / `### Removed` / `### Migration Steps`) before committing. The `version_upgrade` command parses CHANGELOG to migrate end-users while preserving their data — a missing entry means users lose data on upgrade. Skip only for cosmetic edits (typos, formatting) that do not affect command behavior or section structure.
5. **Strict gitignore allowlist.** [`.gitignore`](../.gitignore) ignores `*` then whitelists with `!`. **If you create a new top-level file or folder, you MUST add a matching `!` rule** or git silently ignores it.
6. **Naming conventions.** Files use lowercase-with-underscores (`manager_operating_system.md`, never `MOS.md`). Inline section refs use the abbreviation (`MOS §3`, `MOS §12`). Cross-file path refs use the full path (`01_KERNEL/manager_operating_system.md`).
7. **Header metadata split.** Every template file has `Version` (bumped by maintainers per release, e.g. `2026.02`) and `Last Updated` (touched by end-users via `prep_refresh` / `quarterly_reset`). **Do not touch `Last Updated`** as a maintainer — the file-freshness validator depends on it.
8. **No emojis** unless the user explicitly asks. The few that exist (✅/⚠️/🔴/🟡/🟢 in command outputs and freshness indicators) are a deliberately small set — match that restraint.
9. **No private/company-specific data.** Templates only. The repo is public.
10. **Cross-file consistency.** Edits to layer structure, command definitions, MOS section numbers, capacity/pressure/Rule-Zero behavior, bundle assembly, or the repo URL all require updating multiple files in the same PR. The full mapping lives in [AGENTS.md](../AGENTS.md) §8 — consult it before edits in those areas.

## When in doubt

Read [AGENTS.md](../AGENTS.md) — it has the cross-file consistency table (§8), the quick-index for common edits (§11), the out-of-scope list (§12), and the workflow tips (§10). Surface ambiguous proposals as a question rather than guessing.
