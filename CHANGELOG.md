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

- **New §7 "Partner Teams & Interfaces"** in `03_DRIVERS/team_operating_system.md`
  - Tracks cross-team collaboration, shared goals, communication channels, escalation paths
  - Includes "Carries Over" column to mark relationships that survive team changes within same company
  - Used by: `init_week`, `prep_planning`, `stakeholder_request`, `capacity_check`, `escalate`, `quarterly_reset`
  
- **New Round 3D in SETUP_WIZARD Phase 3** — Partner Teams & Interfaces discovery
  - Asks manager to map all collaborating teams and key contacts during initial setup

### Changed

- **Updated 6 commands** in `05_COMMANDS/command_reference.md` to reference Team OS §7:
  - `init_week` — flags cross-team sync opportunities
  - `prep_planning` — surfaces cross-team dependencies
  - `capacity_check` — accounts for cross-team work in capacity calculation
  - `stakeholder_request` — uses Partner Teams context to frame incoming requests
  - `escalate` — applies predefined escalation paths from §7
  - `quarterly_reset` — explicitly reviews and updates §7 entries (mark "Carries Over" flags)

- **Updated system_prompt.md**:
  - DRIVERS layer description now mentions Partner Teams & Interfaces
  - File Freshness Validation table includes §7 with quarterly refresh cadence

- **Updated documentation**:
  - `00_BOOT/README.md` — architecture diagram and File Reference Guide now reference §7
  - `ARCHITECTURE.md` — Diagrams 2, 4, and 6 updated to show partner teams context
  - `.github/copilot-instructions.md` — Architecture table updated

### Migration Steps

**For existing users upgrading to this version:**

1. **Add §7 to your `team_operating_system.md`:**
   - Copy the new §7 "Partner Teams & Interfaces" section (after §6 Strategic Translation)
   - List all teams your team routinely collaborates with
   - For each: identify key contact, shared goal, communication channel, escalation path
   - Mark "Carries Over: Yes/No" for each (will this relationship survive a team change?)

2. **Re-run affected commands:**
   - `init_week` — will now surface cross-team sync opportunities
   - `stakeholder_request [description]` — will now include partner team context
   - `capacity_check` — will now account for cross-team commitments

3. **Update `quarterly_reset` workflow:**
   - When running at quarter boundary, explicitly review §7
   - Discard entries marked "Carries Over: No" if changing teams
   - Update contacts and shared goals for entries marked "Carries Over: Yes"

4. **Verify §7 was added:**
   - Open your `team_operating_system.md` and confirm §7 "Partner Teams & Interfaces" is present
   - Note: `prep_refresh` checks timestamp staleness only — it will NOT automatically detect a missing §7 section
   - If §7 is absent, copy the template from the updated `03_DRIVERS/team_operating_system.md` and fill it in manually

### Removed

_(No features removed in this release)_
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