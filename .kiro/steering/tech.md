# Technology Stack

## Architecture

Declarative dotfiles management using chezmoi as the core orchestration tool, with platform-specific hooks and conditional templating for cross-platform compatibility.

## Core Technologies

- **Dotfiles Manager**: [chezmoi](https://www.chezmoi.io/) - Manages symlinks, templates, and OS-specific configurations
- **Primary Shells**: Fish (Linux), PowerShell (Windows), Bash (fallback)
- **Primary Editors**: Neovim (lazy.nvim config), Vim
- **Template Language**: chezmoi templates (Go text/template syntax)

## Key Tools and Frameworks

### Neovim Ecosystem

- **Plugin Manager**: lazy.nvim
- **Configuration Language**: Lua
- **LSP**: nvim-lspconfig, mason.nvim
- **Completion**: blink.cmp, LuaSnip
- **UI**: lualine, snacks.nvim(dashboard feature), noice.nvim

### Shell Environment

- **Fish**: Starship prompts
- **PowerShell**: Starship prompts

## Development Standards

### Code Quality

- **Markdown**: textlint (Japanese technical writing preset)
- **Lua**: stylua formatting
- **PowerShell**: PSScriptAnalyzer
- **JavaScript/JSON**: Prettier
- **Spell Check**: cspell with Japanese dictionaries

### Git Workflow

- **Commit Convention**: Conventional Commits (Japanese variant via cz-conventional-changelog-ja)
- **Hooks**: lefthook for pre-commit checks
- **Diff Tool**: delta

## Development Environment

### Required Tools

- chezmoi (latest)
- Git
- Node.js/pnpm (for quality tools)
- Platform-specific: aqua (package manager), mise (runtime version manager)

### Common Commands

```bash
# Apply dotfiles
chezmoi apply --verbose

# Preview changes
chezmoi diff

# Quality checks
pnpm run textlint        # Markdown linting
pnpm run fmt:prettier    # Format files
pnpm run commit          # Conventional commits

# Neovim-specific
cd dot_config/nvim
bash utils/format.sh     # Format Lua files
bash utils/lint.sh       # Lint Lua files
```

## Key Technical Decisions

### Chezmoi Over Alternatives

- Native templating for OS-specific configs
- Secret management (`.add.secrets = "ignore"`)
- Hook system for pre/post-apply automation
- No symlink farm - actual file copies with tracking

### Multi-Config Neovim Strategy

- Main: `nvim` (production, lazy.nvim-based)
- Minimal: `nvim-mini` (lightweight fallback)
- Experimental: `nvim-lit`, `nvim-rocks` (testing ground)
- Allows A/B testing and gradual migration

### OS-Specific Patterns

- Linux: `.profile`, systemd user services, X11/Wayland configs
- Windows: `AppData/`, PowerShell, GlazeWM configs
- Conditional inclusion via `.chezmoiignore.tmpl`

### Package Management Philosophy

- **aqua**: Primary tool installer (cross-platform, version-pinned)
- **Language-specific**: cargo (Rust), go install (Go), pnpm (Node.js)
- **System**: Platform package managers for system dependencies only

---
_created_at: 2026-01-02_

