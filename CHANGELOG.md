# Changelog

All notable changes to the Manager Operating System (MOS) framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), adapted for AI-executable version upgrades.

## How to Upgrade

When a new version is released:

1. Download the new MOS template files
2. Run the `version_upgrade` command in your AI copilot
3. The AI will read your current version, compare to the CHANGELOG, and walk you through the changes

The upgrade preserves all your existing data and only asks about new/changed sections.

---

## [Unreleased]

> Changes documented here will be included in the next version.

### Added

- **`bundle.sh`** — Shell script to compile all MOS files into a single consolidated `mos_compiled.md` file. Simplifies deployment and knowledge management on any platform (ChatGPT, Gemini, Claude, etc.). Preserves original file path markers as HTML comments so you can navigate by `SOURCE FILE` markers or search inside the bundle. Note: relative Markdown links between files are not rewritten, so some file-path links may not work in the compiled bundle. Zero dependencies; works on macOS/Linux.

### Changed

- **`00_BOOT/README.md`** — Updated "AI Copilot Integration" section with bundling as an optional consolidation approach. Updated platform comparison table to note bundling works across all platforms.
- **`SETUP_WIZARD.md`** — Added bundling guidance in Phase 5C (AI Platform selection) explaining how to use `bundle.sh` for simplified single-file deployment.
- **`ARCHITECTURE.md`** — Added §9 "Deploying to AI Platforms" documenting both individual-file and bundled deployment options.

### Removed

None.

### Migration Steps

*(Additive feature — no data migration needed)*

1. **Existing individual-file users:** No action needed. Deployments continue to work unchanged.
2. **New users or those preferring consolidation:** Run `scripts/bundle.sh` to generate `mos_compiled.md`, then upload as a single knowledge file.

---

## [2026.02] - 2026-02-14

**Initial Release** — First versioned release of the Manager Operating System framework.