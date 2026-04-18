# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What is EFU

EFU (Easy-Fast-Upgradable) is a collection of shell scripts that automate developer environment setup on macOS and Ubuntu/Lubuntu. It installs and configures tools like Git, Node.js, Java, Android SDK, Homebrew, oh-my-zsh, and more.

## Running the installer

```sh
# Run for macOS
sh install.sh osx

# Run for Ubuntu
sh install.sh ubuntu

# Run for Lubuntu
sh install.sh lubuntu
```

Logs are written to `~/Downloads/efu.log` (full) and `~/Downloads/summary.efu.log` (summary).

## Testing

The README references a `test.sh` but it does not currently exist. There are no automated tests. Manual testing means running the installer on a target platform.

## Architecture

### Entry point and execution flow

`install.sh` is the single entry point. It:
1. Sources `functions.sh` (all utility/logging functions)
2. Sources `properties.sh` (user-specific config: name and email)
3. Sources `createDirectoriesTree.sh` (creates `~/Coding/{xDKs,tools,workspace-mine,workspace-work,workspace-test}`)
4. Sources `Ubuntu/core.sh` (Ubuntu-only packages) if platform is ubuntu
5. Sources `common.sh` (orchestrates all module scripts)

### Module system

`common.sh` loads each module in order via `.` (dot-source). All modules live under `modules/`. Each module uses the shared functions from `functions.sh` and the `$PLATFORM` variable to branch on OS.

Every module uses `enterDirOrExit "${CURRENT_DIR}"` at the top to reset to the project root, since some modules `cd` into other directories (e.g., `~/Coding/tools`).

### Shared state

- `$PLATFORM` — set in `install.sh`, available to all sourced scripts (`osx`, `ubuntu`, or `lubuntu`)
- `$CURRENT_DIR` — absolute path to the project root, used by modules to return after `cd`-ing elsewhere
- `$USER_FULL_NAME` / `$USER_EMAIL` — from `properties.sh`, used by `modules/git.sh`

### Logging conventions

All output goes through functions in `functions.sh`:
- `logInfo` — writes to stdout and `efu.log`
- `logSummary` — writes to stdout, `efu.log`, and `summary.efu.log`
- `logError` / `logWarn` — write to stdout, `efu.log`, and `summary.efu.log`
- `logAlreadyInstalled` / `preInstallationLog` / `postInstallationLog` — wrappers for consistent install messages

### Adding a new module

1. Create `modules/yourmodule.sh` using `preInstallationLog`/`postInstallationLog` for consistency.
2. Add `command -v` guards to skip if already installed.
3. Source it in `common.sh` with a `shellcheck source=` comment.
4. Use `enterDirOrExit "${CURRENT_DIR}"` at the top if the module changes directories.

### User customization

Edit `properties.sh` before running — it sets `USER_FULL_NAME` and `USER_EMAIL` used for Git global config.
