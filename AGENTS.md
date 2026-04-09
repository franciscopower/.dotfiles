# AGENTS.md

This is a cross-platform dotfiles repository (Linux + Windows). There is no top-level build system.

## Bootstrap / Setup
- **Linux (Debian):** `sudo ./linux/setup_debian.sh <username>`
- **Linux (Fedora):** `sudo ./linux/setup_fedora.sh <username>`
- **Windows:** `.\windows\setup.ps1`

## No Lint / Test Commands
There are no linting or test commands for first-party code. Vendored zsh plugins have their own Makefiles (`make test`) but should not be modified.

## Languages & Style

### Shell (Bash / Zsh)
- Indent with **tabs**.
- Use `SCREAMING_SNAKE_CASE` for exported/global vars, `snake_case` for locals and functions.
- Guard file sources with `[ -f <file> ] && source <file>`.
- Suppress stderr for optional commands: `cmd 2>/dev/null`.
- Check binary availability with `command -v <bin> &>/dev/null` before aliasing.

### Lua (Neovim / WezTerm)
- Indent with **2 spaces**. Use `stylua` formatting (no config file; defaults apply).
- Double quotes only. Trailing commas in multi-line tables.
- `snake_case` for locals/functions; `SCREAMING_SNAKE_CASE` for constants.
- Neovim plugins live in `nvim/lua/plugins/` and return a lazy.nvim spec table directly (no `M` export).
- WezTerm modules use `local M = {}; return M` pattern.
- Defer `require()` calls inside `config = function()` callbacks to avoid eager loading.

### PowerShell
- `PascalCase` for functions and local variables.
- Use `Test-Path` before creating files/dirs; use `-ErrorAction SilentlyContinue` for optional operations.

## Git Conventions
Follow Conventional Commits (`feat:`, `fix:`, `chore:`, etc.). Never force-push. See `opencode/skill/git/SKILL.md.bk` for the full git workflow skill.
