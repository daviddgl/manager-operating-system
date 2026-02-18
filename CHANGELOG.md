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

- **`bundle.sh`** — Shell script to compile all MOS files into a single consolidated `mos_compiled.md` file. Simplifies deployment and knowledge management on any platform (ChatGPT, Gemini, Claude, etc.).

- **New `06_BOARDROOM/` layer** — Virtual advisory council, permanently portable (travels with the manager)
  - `06_BOARDROOM/boardroom.md` — Persona definitions (6 default slots with famous-figure anchors), working principles, and manager profile
  - Personas: Execution & Output Engine, People & Trust Coach, Purpose & Narrative Strategist, Principles & Radical Candor Force, Challenger & Risk Detector, Vulnerability & Wellbeing Anchor

- **New `boardroom [topic]` command** (command #15, Boardroom category) in `05_COMMANDS/command_reference.md`
  - Reads: `06_BOARDROOM/boardroom.md` §1–§3, `01_KERNEL/personal_dna.md`, `01_KERNEL/manager_operating_system.md` §12
  - Auto-selects 3–4 relevant personas based on topic type
  - Output: per-persona perspective + probing questions → Integrated Synthesis → Rule Zero reminder
  - Chains with: `stakeholder_request`, `escalate`

- **New Phase 5 "YOUR BOARDROOM" in SETUP_WIZARD** (~10 min) — inserted before Finalize (old Phase 5 → Phase 6)
  - Round 5A: Boardroom purpose and scope
  - Round 5B: Build your 6 personas (keep defaults or replace anchors)
  - Round 5C: Confirm working principles
  - Generates: `06_BOARDROOM/boardroom.md`

### Changed

- **Updated 6 commands** in `05_COMMANDS/command_reference.md` to reference Team OS §7:
  - `init_week` — flags cross-team sync opportunities
  - `prep_planning` — surfaces cross-team dependencies
  - `capacity_check` — accounts for cross-team work in capacity calculation
  - `stakeholder_request` — uses Partner Teams context to frame incoming requests
  - `escalate` — applies predefined escalation paths from §7
  - `quarterly_reset` — explicitly reviews and updates §7 entries (mark "Carries Over" flags)

- **Updated `05_COMMANDS/system_prompt.md`**:
  - DRIVERS layer description now mentions Partner Teams & Interfaces
  - Added `06_BOARDROOM/` layer description
  - Added Persona Simulation Mode section (boardroom-specific behaviour carve-out)
  - Session Memory now tracks `boardroom` command output for chaining

- **Updated `SETUP_WIZARD.md`**:
  - Phase 5 "FINALIZE" renumbered to Phase 6
  - New Phase 5 "YOUR BOARDROOM" inserted
  - Progress bar updated to 6 phases
  - Completion block now lists `06_BOARDROOM/boardroom.md` as generated file
  - Bundling guidance added in Phase 6C (AI Platform selection)

- **Updated `ARCHITECTURE.md`**:
  - All diagrams and tables updated for `06_BOARDROOM/` layer and `boardroom` command (#15)
  - Layer 06 added to bundle structure list and summary
  - "14 operations" → "15 operations" throughout

- **Updated `README.md`**, **`00_BOOT/README.md`**, **`.github/copilot-instructions.md`**:
  - Folder structure, portability contract, and command tables updated for `06_BOARDROOM/` and 15 commands

- **Updated `.gitignore`** — `06_BOARDROOM/` added to allowlist

- **Updated `scripts/bundle.sh`** — `06_BOARDROOM/boardroom.md` added to compilation order and header layer list

### Removed

_(No features removed in this release)_

### Migration Steps

**For existing users upgrading to this version:**

1. **Add §7 to your `team_operating_system.md`:**
   - Copy the new §7 "Partner Teams & Interfaces" section (after §6 Strategic Translation)
   - List all teams your team routinely collaborates with
   - For each: identify key contact, shared goal, communication channel, escalation path
   - Mark "Carries Over: Yes/No" for each

2. **Re-run affected commands to surface Partner Teams context:**
   - `init_week`, `stakeholder_request`, `capacity_check`

3. **Create `06_BOARDROOM/boardroom.md`:**
   - Copy the new template from `06_BOARDROOM/boardroom.md`
   - Fill in §2 Manager's Chair (or run SETUP_WIZARD Phase 5 to be guided)
   - Replace `[Your Andy Grove]`, `[Your Bill Campbell]`, etc. with figures that resonate with you (or keep the defaults)

4. **Test the boardroom command:**
   - Run: `boardroom I need to decide [a current management situation]`
   - Verify 3–4 personas are selected, each provides a perspective, output closes with Rule Zero

5. **Bundled deployment users:** Re-run `scripts/bundle.sh` to regenerate `mos_compiled.md` with the new `06_BOARDROOM/boardroom.md` included

---

## [2026.02] - 2026-02-14

**Initial Release** — First versioned release of the Manager Operating System framework.