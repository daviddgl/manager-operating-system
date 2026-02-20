# Templates

This folder contains profession-specific setup entry points for the Manager Operating System (MOS) framework.

## Structure

Each subfolder represents one profession:

```
templates/
├── manager/      ← Engineering Manager OS (this repo)
│   ├── SETUP_WIZARD.md    # AI interview prompt — paste into ChatGPT/Gemini
│   └── mos_template.md    # Blank template bundle — upload alongside the wizard
└── [profession]/ ← Future: coach/, sales_leader/, etc.
    ├── SETUP_WIZARD.md
    └── [profession]_template.md
```

## How It Works

1. **User pastes** `SETUP_WIZARD.md` into their AI as the first message
2. **User uploads** `mos_template.md` alongside it
3. **AI interviews** the user through 6 phases (~45 min)
4. **AI outputs** a complete, filled `mos_compiled.md` (the user's OS)
5. **User deploys**: upload `mos_compiled.md` as knowledge + paste `00_BOOT/bootstrap_prompt.md` into Custom Instructions

That's it — no shell scripts, no individual files to manage, no folder setup.

## Maintenance

`mos_template.md` is a **generated artifact** — it is produced by `scripts/bundle.sh` and committed here as the blank template for new users. It must stay in sync with the source template files (`00_BOOT/` through `06_BOARDROOM/`).

**If you edit any source template file, regenerate `mos_template.md` before committing:**

```bash
scripts/bundle.sh
```

A pre-commit hook (`.git/hooks/pre-commit`) enforces this automatically — it will block commits where the template file is out of sync with the generated output.

## Adding a New Profession

To add support for a new profession (e.g., `coach`):

1. Create `templates/coach/` folder
2. Write `templates/coach/SETUP_WIZARD.md` — tailored interview questions for that profession
3. Create source template files for that profession (or reuse/adapt existing `00_`–`06_` templates)
4. Update `scripts/bundle.sh` to also output `templates/coach/cos_template.md`
5. Add the new profession to this README

The framework core (`00_`–`06_` folders, `05_COMMANDS/`) should remain profession-agnostic where possible. Profession-specific content lives in the template files and the wizard.
