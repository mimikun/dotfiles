# Project Structure

## Organization Philosophy

Mirrors the target filesystem structure using chezmoi's special prefixes (`dot_`, `private_`, `executable_`, etc.) to encode file attributes. Platform-specific files are conditionally managed via `.chezmoiignore.tmpl` templating.

## Directory Patterns

### Dotfiles Root (`/`)

**Location**: Repository root
**Purpose**: chezmoi source directory - maps to `$HOME` after transformation
**Pattern**: `dot_filename` → `.filename`, `dot_dirname` → `.dirname`

### Configuration Files (`dot_config/`)

**Location**: `dot_config/` → `~/.config/`
**Purpose**: XDG Base Directory compliant application configs
**Examples**:
- `dot_config/nvim/` → Neovim production config
- `dot_config/fish/` → Fish shell config
- `dot_config/alacritty/` → Alacritty terminal config

### Scripts and Executables (`private_dot_local/bin/`)

**Location**: `private_dot_local/bin/` → `~/.local/bin/` (private, executable)
**Purpose**: User-specific executables and helper scripts
**Pattern**: Files auto-marked executable by chezmoi

### Windows-Specific (`AppData/`)

**Location**: `AppData/` → `C:\Users\{user}\AppData\`
**Purpose**: Windows application data (roaming profiles, local data)
**Examples**: PowerShell modules, terminal configs, IME dictionaries

### Chezmoi Automation (`.chezmoiscripts/`)

**Location**: `.chezmoiscripts/{linux,windows,macos}/`
**Purpose**: Platform-specific install/setup scripts (not deployed to target)
**Pattern**: Run during `chezmoi apply`, organized by OS

### Templates (`.tmpl` suffix)

**Location**: Throughout repository
**Purpose**: Files requiring OS/hostname-specific content
**Examples**:
- `.chezmoi.toml.tmpl` → chezmoi config with conditional hooks
- `.gitconfig.tmpl` → Git config with user-specific settings
- `.chezmoiignore.tmpl` → Conditional file exclusions

## Naming Conventions

### Files and Directories

- **Dotfiles**: `dot_` prefix (e.g., `dot_bashrc` → `.bashrc`)
- **Private files**: `private_` prefix (prevents accidental sharing, restrictive permissions)
- **Executables**: `executable_` prefix or placed in `bin/` dirs
- **Templates**: `.tmpl` suffix (processed during apply)
- **Read-only**: `readonly_` prefix

### Neovim Lua Modules

- **Plugins**: `dot_config/nvim/lua/plugins/{name}.lua`
- **Config modules**: `dot_config/nvim/lua/config/{aspect}.lua`
- **Utilities**: `dot_config/nvim/lua/utils/{helper}.lua`
- **Pattern**: Lowercase, hyphenated filenames

### Shell Scripts

- **Fish functions**: `dot_config/fish/functions/{name}.fish`
- **Utilities**: `scripts/{purpose}.sh` or `scripts/{purpose}.ps1`
- **Pattern**: Lowercase, hyphens for multi-word

## Conditional Organization Patterns

### OS-Specific Inclusion

```gitignore
# .chezmoiignore.tmpl example
{{ if (ne .chezmoi.os "linux") }}
.config/fish/**
.config/i3/**
{{ end }}

{{ if (ne .chezmoi.os "windows") }}
AppData/**
.glzr/**
{{ end }}
```

### Environment-Aware Logic

- **Work vs Personal**: Checks for sentinel executables (`this_is_work_pc`)
- **Hostname-Specific**: Special configs for named machines (e.g., `azusa` → full i3/X11 setup)
- **Feature Detection**: Uses `isExecutable`, file existence tests

## Code Organization Principles

### Separation of Concerns

- **Config**: `.config/` for application settings
- **Data**: `.local/share/` for application data
- **Binaries**: `.local/bin/` for user scripts
- **Cache**: Not tracked (explicitly ignored)

### Template Inheritance

- Base config files with `.tmpl` extension
- Platform-specific overrides via conditional blocks
- Shared logic in templates, platform differences isolated

### Multi-Version Strategy

- Multiple Neovim configs for testing/migration
- Parallel shell configs (fish, bash, zsh) for compatibility
- Ignored via `.chezmoiignore.tmpl` when not on target platform

### Ignored Content

- Build artifacts: `node_modules/`, `*.zip`, `*.patch`
- Generated files: `.textlintcache`, chezmoi output files
- Documentation: Most `README.md` files (except source repo root)
- Development metadata: `.github/`, `.mise/`, `.kiro/` (except steering/specs)

---
_created_at: 2026-01-02_

