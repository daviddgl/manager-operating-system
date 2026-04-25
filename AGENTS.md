# AGENTS.md — Manager Operating System (MOS)

> **Audience:** AI coding agents (Claude Code, Cursor, Copilot, Codex, Aider, etc.) that **edit, refactor, or contribute to this repository**.
>
> **Not for AI copilots that *load* MOS as a manager's knowledge base** — those are bootstrapped via [`00_BOOT/bootstrap_prompt.md`](00_BOOT/bootstrap_prompt.md) and read [`05_COMMANDS/system_prompt.md`](05_COMMANDS/system_prompt.md). If your job is to *operate* the OS for an end-user manager, follow that chain instead.

---

## 1. What This Repository Is

This is a **Manager Operating System (MOS)** — a portable, markdown-based decision-support framework for engineering managers. **It is not a code project.** Every file is structured Markdown designed to be uploaded into AI copilots (ChatGPT Projects, Gemini Gems, Claude Projects) as knowledge files. The only executable is [`scripts/bundle.sh`](scripts/bundle.sh), which concatenates the markdown into a single `bundle/mos_compiled.md` for platforms that prefer one knowledge file.

- **Abbreviation:** "MOS" — used after the first mention of "Manager Operating System" in any document.
- **Created by:** David Garcia Lopez (see [AUTHORS.md](AUTHORS.md)).
- **Public, MIT-licensed:** all content must remain company-agnostic and reusable.

---

## 2. Repository Layout (OS-Layer Metaphor)

The repo follows an OS-layer metaphor with numbered folders. **Preserve this structure** — do not rename, renumber, or flatten.

| Folder | Layer | Lifecycle | Purpose |
|--------|-------|-----------|---------|
| [`00_BOOT/`](00_BOOT/) | System manual | Permanent | Architecture docs, onboarding, portability contract, `bootstrap_prompt.md` |
| [`01_KERNEL/`](01_KERNEL/) | Portable core | Permanent | Philosophy, decision protocols, Personal DNA — travels with the manager |
| [`02_CONFIG/`](02_CONFIG/) | Environment | Per-company | Company mission, values, strategy — inherited context |
| [`03_DRIVERS/`](03_DRIVERS/) | Swappable | Per-team | Team OS (squad, capacity, rituals, partner teams), player cards — replaced when changing teams |
| [`04_PROCESSES/`](04_PROCESSES/) | Ephemeral | Per-quarter | Tactical plan, current roadmap — replaced quarterly |
| [`05_COMMANDS/`](05_COMMANDS/) | Interface | Permanent | Named AI commands (`command_reference.md`) + master `system_prompt.md` |
| [`06_BOARDROOM/`](06_BOARDROOM/) | Advisory council | Permanent | Virtual advisory council — portable persona definitions, travels with the manager |

**Root folder** contains only repository metadata and onboarding entry docs ([README.md](README.md), [LICENSE](LICENSE), [NOTICE](NOTICE), [SETUP_WIZARD.md](SETUP_WIZARD.md), [ARCHITECTURE.md](ARCHITECTURE.md), [CONTRIBUTING.md](CONTRIBUTING.md), [CHANGELOG.md](CHANGELOG.md), [CONTACT.md](CONTACT.md), [AUTHORS.md](AUTHORS.md), [CLAUDE.md](CLAUDE.md), this file).

**Visual reference:** [ARCHITECTURE.md](ARCHITECTURE.md) contains 8 Mermaid diagrams (layer hierarchy, system graph, weekly lifecycle, command details, data flow, portability, decision-protocol gates, quick reference). When you change layer structure or commands, update the affected diagrams (especially diagrams 2, 3, 4, 8) and keep [`00_BOOT/README.md`](00_BOOT/README.md) (narrative) in sync with ARCHITECTURE.md (visual).

---

## 3. How the System Works (For Context When Editing)

**Setup phase (one-time, by the end-user manager):**
1. Manager runs [`SETUP_WIZARD.md`](SETUP_WIZARD.md) (a system prompt pasted into ChatGPT/Gemini/Claude).
2. Fills in KERNEL (personal philosophy), CONFIG (company), DRIVERS (team), PROCESSES (quarter).
3. Uploads MOS files to the AI platform as a Knowledge Project (or uploads the bundled `mos_compiled.md`).
4. Pastes [`00_BOOT/bootstrap_prompt.md`](00_BOOT/bootstrap_prompt.md) into Custom Instructions (static — version-independent).

**Execution phase (ongoing):**
1. Manager invokes one of the named commands (e.g., `init_week`, `stakeholder_request`, `prep_refresh`, `version_upgrade`, `boardroom`).
2. The command definition in [`05_COMMANDS/command_reference.md`](05_COMMANDS/command_reference.md) tells the AI which OS files/sections to read (logic) and which external tools (Jira, Airtable, Slack) to query (data).
3. AI copilot produces structured output (decision, plan, prep notes) following the command's Output Format.
4. Manager executes, logs results back to external tools. Loop repeats daily/weekly/quarterly.

**Logic vs. Data — the central design rule:**
- **MOS files** = source of truth for *how* decisions are made (portable, reusable).
- **Jira / Airtable / Slack** = source of truth for *what* work exists (context-specific, replaceable).
- Commands are adapters: read logic from MOS, read data from external tools, produce recommendations.

**Portability contract:** When a manager changes teams/companies, they keep KERNEL + COMMANDS + BOARDROOM (the logic), update CONFIG (new company), and replace DRIVERS + PROCESSES (new team + quarter). Any change to KERNEL/COMMANDS/BOARDROOM must therefore stay generic — no company- or team-specific assumptions.

---

## 4. Critical Design Principles (Do Not Violate)

1. **Logic vs. Data separation.** Never embed live task data, real names, real metrics, or company-specific content in template files. Templates use `[bracket]` placeholders and `<!-- HTML comments -->` for inline guidance.
2. **Portability contract.** KERNEL, COMMANDS, and BOARDROOM must be backward-compatible and generic. CONFIG is per-company. DRIVERS + PROCESSES are replaceable.
3. **Decision support, not decision making.** The OS surfaces trade-offs and flags issues; humans make the call. Rule Zero (Decision Protocol §0) is sacred — when ambiguous, the manager talks to affected parties, not the system.
4. **Capacity Contract.** Defined per-team in Team OS §4 (chosen by the manager during setup — examples: 70/30, 80/20, 60/40). The system enforces the *chosen* ratio, never a hardcoded default.
5. **Pressure Mode.** MOS §12 defines stress-indicator patterns. The AI copilot proactively detects them and suggests de-escalation. Treat this as a safety mechanism — do not weaken it.
6. **Command independence.** Each command in `05_COMMANDS/command_reference.md` is self-contained and runnable in isolation, but all commands read from the same KERNEL/CONFIG/DRIVERS/PROCESSES/BOARDROOM files for consistent decision logic.

---

## 5. Naming & Style Conventions

### Naming
- Full name: **"Manager Operating System"** — used in titles, first mentions, file names.
- Abbreviation: **"MOS"** — used in section references (e.g., MOS §3, MOS §12), tables, repeated mentions.
- File names: lowercase with underscores. ✅ `manager_operating_system.md`. ❌ `Manager Operating System.md`, `MOS.md`.
- Apply consistently: `personal_dna.md`, `team_operating_system.md`, `tactical_plan.md`, `system_prompt.md`, `command_reference.md`, `bootstrap_prompt.md`, `boardroom.md`.

### File references inside content
- Cross-reference real file paths in lowercase with underscores: `01_KERNEL/manager_operating_system.md`.
- Inline section references use the MOS abbreviation: "MOS §3", "MOS §12".

### Section numbering
- [`01_KERNEL/manager_operating_system.md`](01_KERNEL/manager_operating_system.md) uses §1–§13. These numbers are referenced throughout commands, the Decision Protocol, and the System Prompt.
- **Never renumber existing sections.** Add new sections at the end (e.g., §14) and document via CHANGELOG. Renumbering breaks every cross-reference.

### Writing style
- Practical and concise. No filler. No marketing copy.
- Use `[bracket]` placeholders for user-specific content.
- Use `<!-- HTML comments -->` for inline guidance to template fillers (rendered invisible in most viewers).
- Mark incomplete items as `[TODO]`.

---

## 6. File Header Maintenance

Every MOS template file has a header with two metadata fields:

| Field | Updated By | When |
|-------|-----------|------|
| `Version` | Framework maintainers (us) | Per release (e.g., `2026.02`) |
| `Last Updated` | End-user manager | When they run `prep_refresh` or `quarterly_reset` |

**As a maintainer agent:** when releasing a new version, bump `Version` in affected files. **Do not touch `Last Updated`** — it belongs to the end user, and the file-freshness validator (defined in `system_prompt.md`) compares it against expected refresh frequencies (weekly for `tactical_plan`, monthly for player cards, quarterly for team/company files, etc.) to drive `prep_refresh` warnings.

Header format:
```markdown
> **Layer:** [BOOT/KERNEL/CONFIG/DRIVERS/PROCESSES/COMMANDS/BOARDROOM]
> **Owner:** [Your Name]
> **Version:** 2026.02
> **Last Updated:** [YYYY-MM-DD]
> **Portable:** [Yes/No]
```

---

## 7. CHANGELOG Maintenance (Critical)

**Every framework change MUST be documented in [`CHANGELOG.md`](CHANGELOG.md) before committing.** This is not optional — the `version_upgrade` command parses CHANGELOG to walk end-users through migrations while preserving their data. A missing entry means users lose data on upgrade.

**Process for any non-trivial change:**

1. Make your changes to framework files.
2. **Before committing,** open CHANGELOG.md and add entries to `[Unreleased]` under the right category:
   - `### Added` — new files, commands, sections, features
   - `### Changed` — renamed sections, modified structure, updated commands
   - `### Removed` — deprecated features, deleted sections
   - `### Migration Steps` — machine-readable instructions for breaking changes
3. Be specific and machine-readable — `version_upgrade` parses these strings.
4. On release, move `[Unreleased]` content into a new `## [YYYY.MM] - YYYY-MM-DD` section and reset `[Unreleased]` to empty placeholders.

**Example:**
```markdown
## [Unreleased]

### Added
- New §14 in `01_KERNEL/manager_operating_system.md` — Decision Delegation Framework
- New command `team_health_check` in Execution category

### Changed
- Renamed Team OS §6 "Strategic Translation" → "Strategic Alignment"

### Migration Steps
1. Add §14 to `01_KERNEL/manager_operating_system.md` after §13: [template text]
2. Update `03_DRIVERS/team_operating_system.md` §6 header: rename "Strategic Translation" → "Strategic Alignment"
3. Re-run `init_week` to verify
```

Skip CHANGELOG only for cosmetic edits (typos, formatting) that do not affect command behavior or section structure.

---

## 8. Cross-File Consistency Rules

When you edit any of these, update the others in the same PR — they cross-reference each other and must stay in sync:

| If you change… | Also update… |
|----------------|--------------|
| Layer structure (folders, file purposes) | [`00_BOOT/README.md`](00_BOOT/README.md), [`ARCHITECTURE.md`](ARCHITECTURE.md) (diagrams 1, 2, 6), [`README.md`](README.md), this file (§2) |
| A command's name, inputs, files-read, or output format | [`05_COMMANDS/command_reference.md`](05_COMMANDS/command_reference.md), [`ARCHITECTURE.md`](ARCHITECTURE.md) (diagram 4 table), [`README.md`](README.md) commands table |
| `01_KERNEL/manager_operating_system.md` section numbers | every command's "OS Files to Read" list in `05_COMMANDS/command_reference.md`, the Critical Rules Enforcement table in `05_COMMANDS/system_prompt.md`, [`ARCHITECTURE.md`](ARCHITECTURE.md) diagram 7 |
| Capacity Contract, Pressure Mode, or Rule Zero behavior | `01_KERNEL/manager_operating_system.md`, `01_KERNEL/manager_decision_protocol.md`, `05_COMMANDS/system_prompt.md` (Critical Rules table), [`00_BOOT/README.md`](00_BOOT/README.md) Key Protocols table |
| Bundle assembly order or new layer file | [`scripts/bundle.sh`](scripts/bundle.sh), `version_upgrade` inline-bundle section in `05_COMMANDS/command_reference.md`, [`ARCHITECTURE.md`](ARCHITECTURE.md) §9 |
| Repository URL or remote-fetch URL | [`05_COMMANDS/system_prompt.md`](05_COMMANDS/system_prompt.md) "Repository URL" section, `version_upgrade` command in `05_COMMANDS/command_reference.md` |

**Special files to know about:**

- [`SETUP_WIZARD.md`](SETUP_WIZARD.md) — a system prompt pasted into external AI tools to guide first-time setup. Self-contained: it must reference current repo structure accurately. Update when adding/removing layers.
- [`05_COMMANDS/system_prompt.md`](05_COMMANDS/system_prompt.md) — master AI copilot instruction. **Bundled inside `mos_compiled.md`**, not pasted separately. Changes here affect all command execution behavior.
- [`00_BOOT/bootstrap_prompt.md`](00_BOOT/bootstrap_prompt.md) — the static Custom Instructions text. A tiny pointer telling the AI to load `05_COMMANDS/system_prompt.md` from the bundle. **Version-independent — should almost never change.** Touch only if the `<!-- SOURCE FILE: -->` marker format itself changes.
- [`scripts/bundle.sh`](scripts/bundle.sh) — concatenates files in layer order with `<!-- SOURCE FILE: [path] -->` markers. If you add a new file in a layer that should ship in the bundle, add a corresponding `add_file_to_bundle` line.

---

## 9. Repository Policy

- **Strict gitignore allowlist.** [`.gitignore`](.gitignore) ignores everything (`*`) and then whitelists specific paths with `!`. **If you create a new top-level file or folder, you MUST add a matching `!` rule to `.gitignore`** or git will silently ignore it.
- **No private or company-specific data.** Templates only. Names, metrics, internal URLs, anything proprietary — never commit.
- **All content must remain company-agnostic and reusable.** This is a public, MIT-licensed framework.

---

## 10. Workflow Tips for Coding Agents

- **Prefer editing existing files** to creating new ones. The layer structure is intentional; new files should fit a layer or be justified.
- **Read before editing.** Templates have established voices and formatting (tables, callouts, `> **Layer:**` headers). Match the surrounding style.
- **Verify cross-references after section changes.** Grep for the section number/name across the repo before committing — `grep -rn "MOS §3"` etc.
- **No emojis** unless the user explicitly asks. The existing files use a few sparingly (✅/⚠️/🔴/🟡/🟢 in command outputs and freshness indicators) — match that restraint.
- **Don't create `.md` files outside the layer folders or the documented root set.** If you think a new top-level doc is needed, ask first.
- **There is no test suite, no linter, no CI.** The "validation" is human review of markdown. Be deliberate; small reversible changes are preferred (see [CONTRIBUTING.md](CONTRIBUTING.md)).
- **The bundle is generated, not committed.** [`bundle/`](bundle/) (if it exists) is local; it is not in the gitignore allowlist and stays out of source control.

---

## 11. Quick Index for Common Edits

| Want to… | Edit |
|----------|------|
| Add a new command | [`05_COMMANDS/command_reference.md`](05_COMMANDS/command_reference.md) (full definition) + [`README.md`](README.md) commands table + [`ARCHITECTURE.md`](ARCHITECTURE.md) diagrams 2 & 4 + CHANGELOG `### Added` |
| Add a new section to KERNEL MOS | Append after §13 in [`01_KERNEL/manager_operating_system.md`](01_KERNEL/manager_operating_system.md) (never renumber) + add to relevant commands' "OS Files to Read" + CHANGELOG `### Added` + Migration Steps |
| Change a command's output format | [`05_COMMANDS/command_reference.md`](05_COMMANDS/command_reference.md) command section + CHANGELOG `### Changed` |
| Add a new persona to the boardroom | [`06_BOARDROOM/boardroom.md`](06_BOARDROOM/boardroom.md) §3 + persona-selection table in `command_reference.md` `boardroom` command + CHANGELOG `### Added` |
| Tune file freshness windows | [`05_COMMANDS/system_prompt.md`](05_COMMANDS/system_prompt.md) "File Update Frequency & Grace Periods" table + per-command "Critical Files for Freshness" sections in `command_reference.md` |
| Add a new MOS layer | All eight referenced docs in §8 above + [`scripts/bundle.sh`](scripts/bundle.sh) + [`.gitignore`](.gitignore) allowlist + new layer in [`00_BOOT/README.md`](00_BOOT/README.md) architecture diagram + this file §2 |

---

## 12. Out of Scope

This repository is **not**:
- A code project (no source code beyond `bundle.sh`).
- A SaaS product or hosted service.
- A place for any individual manager's filled-in data — only templates live here.
- A general management-coaching corpus — every file serves the structured command system.

If a proposed change doesn't fit the layered, portable, command-driven model described above, surface it as a question rather than implementing it.

---

*For author contact and contribution channels, see [CONTACT.md](CONTACT.md) and [CONTRIBUTING.md](CONTRIBUTING.md).*
