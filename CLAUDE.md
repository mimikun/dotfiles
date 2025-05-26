# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), containing cross-platform configuration files for various development tools and applications.

## Key Commands

### Linting and Formatting

#### Linux

```bash
# Run all linters
make lint

# Format code
make format
```

#### Windows

```powershell
# Run all linters
mask lint

# Format code
mask format
```

### Testing

#### Linux

```bash
make test  # Currently runs lint
```

#### Windows

```bash
mask test  # Currently runs lint
```

### Update Tasks

#### Linux

```bash
make update  # Updates package lists, fish completions, aqua packages, etc.
```

#### Windows

```bash
mask update  # Updates package lists, fish completions, aqua packages, etc.
```

## Architecture and Structure

### Directory Organization

- **`dot_config/`**: Main configuration directory for *nix tools (nvim, fish, alacritty, etc.)
- **`AppData/`**: Windows-specific application configurations
- **Template Files**: Files ending in `.tmpl` are chezmoi templates that generate platform-specific configs
- **Multiple Neovim Configs**: 
    - `dot_config/nvim/`: Main lazy.nvim-based configuration
    - `dot_config/nvim-rocks/`: rocks.nvim-based configuration
    - `dot_config/nvim-mini/`: mini.nvim-based configuration

### Key Configuration Patterns

1. **Platform Detection**: Templates use chezmoi variables to detect OS/hostname and generate appropriate configs
2. **Modular Structure**: Most tool configs are split into multiple files for organization (e.g., nvim plugins are individual files)
3. **Cross-Shell Support**: Configurations exist for fish, zsh, bash, PowerShell, and others

### Development Workflow

1. Make changes to source files (not the deployed dotfiles)
2. Use `chezmoi diff` to preview changes
3. Use `chezmoi apply` to deploy changes
4. Run linters before committing: `make lint`
5. Create patches if needed: `make patch`

## Important Files

- **`Makefile`**: Primary task runner with common development commands
    - Mainly used on Linux
- **`maskfile.md`**: Additional task definitions using mask
    - Mainly used on Windows
- **`mise.toml`**: Task definitions for mise
- **`renovate.json5`**: Dependency update configuration
- **`.github/workflows/`**: CI/CD workflows for linting and validation

## Chezmoi-Specific Notes

- This repository is the source state, not the deployed state
- Files prefixed with `dot_` become `.` files when deployed
- `private_` prefix indicates files that should have restricted permissions
- `executable_` prefix makes files executable when deployed
