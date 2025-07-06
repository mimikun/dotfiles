# 🏗️ CLAUDE.md - mimikun's dotfiles Project Configuration

This file provides guidance to Claude Code when working specifically with this dotfiles project.

## 📋 Project Overview

This is a comprehensive cross-platform dotfiles repository managed by chezmoi, supporting Linux, Windows, and macOS environments with automated workflows and quality assurance.

### Core Technologies

- **chezmoi**: Dotfiles management with templating and secret integration
- **mise**: Tool version management and task automation
- **aqua**: Lightweight package manager for CLI tools
- **lefthook**: Git hooks for quality assurance
- **renovate**: Automated dependency updates

## 🔧 Core Workflows

### chezmoi Operations

```bash
# Apply dotfiles (primary workflow)
chezmoi apply --verbose

# Check differences before applying
chezmoi diff

# View current status
chezmoi status

# Edit template files
chezmoi edit <file>

# Re-initialize from repository
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

### mise Task Management

```bash
# Run linting
mise tasks run lint

# Run formatting
mise tasks run format

# Clean temporary files
mise tasks run clean

# Update dependencies
mise tasks run update

# Create patch branch
mise tasks run patch:branch

# View all available tasks
mise tasks list
```

### aqua Package Management

```bash
# Install packages defined in aqua.yaml
aqua install

# Update packages
aqua update

# Add new package
aqua generate <package-name>
```

## 💻 Development Standards

### Lua Development (Neovim Configurations)

- **Target**: Lua 5.1 (Neovim compatibility)
- **Formatting**: Use `stylua` for code formatting
- **Linting**: Use `selene` for static analysis
- **Structure**: Follow lazy.nvim plugin specifications

```lua
-- Plugin structure example
return {
  "plugin/name",
  dependencies = {},
  opts = {},
  config = function(_, opts)
    -- Configuration
  end,
}
```

### Shell Scripting Standards

#### Bash Scripts
```bash
#!/usr/bin/env bash
set -euo pipefail

# Use chezmoi template variables when needed
{{- if eq .chezmoi.os "windows" }}
# Windows-specific code
{{- else }}
# Unix-specific code
{{- end }}
```

#### PowerShell Scripts
```powershell
#Requires -Version 5.1
[CmdletBinding()]
param()

# Use PSScriptAnalyzer compliant code
```

### chezmoi Template Management

#### OS Detection Patterns
```go-template
{{- $isWindows := (eq .chezmoi.os "windows") -}}
{{- $isLinux := (eq .chezmoi.os "linux") -}}
{{- $isMacOS := (eq .chezmoi.os "darwin") -}}
{{- $isWorkLinux := (and (eq .chezmoi.os "linux") (isExecutable "/usr/local/bin/this_is_work_pc")) -}}
{{- $isWorkWindows := (and (eq .chezmoi.os "windows") (isExecutable "C:\\Program Files\\Yt Env Checks\\this_is_work_pc.exe")) -}}
{{- $isWorkPC := (or $isWorkLinux $isWorkWindows) -}}
```

#### Secret Management
```go-template
{{- if $isWorkPC }}
# Work PC: Use Bitwarden CLI
{{- if $isWorkLinux }}
{{ (rbwFields "item-name").field_name.value }}
{{- else }}
{{ (bitwardenFields "item" "item-id").field_name.value }}
{{- end }}
{{- else }}
# Personal PC: Use static values
{{- end }}
```

## 🔍 Quality Assurance

### Pre-commit Hooks (lefthook)

The project uses lefthook for automated quality checks:

```bash
# Manual execution of pre-commit hooks
lefthook run pre-commit

# Install git hooks
lefthook install
```

### Linting & Formatting Commands

```bash
# Lua files (Neovim configs)
stylua --check .
selene .

# JavaScript/TypeScript
npx prettier --check .
npx textlint docs/

# Spell checking
npx cspell "**/*.md" "**/*.txt"

# PowerShell
pwsh -Command "Invoke-ScriptAnalyzer -Path . -Recurse"
```

### Testing Workflow

```bash
# Run all quality checks
make lint

# Run formatting
make format

# Clean temporary files
make clean

# Full test suite
make test
```

## 📁 Project Structure Conventions

### Configuration Files
- `dot_*`: Files/directories that become `.filename` in home directory
- `*.tmpl`: Template files processed by chezmoi
- `private_*`: Files with restricted permissions
- `executable_*`: Files that should be executable

### Directory Organization
```
dot_config/
├── nvim/           # Neovim configuration
├── fish/           # Fish shell configuration
├── alacritty/      # Terminal emulator configs
└── ...

AppData/            # Windows-specific app data
Documents/          # Windows-specific PowerShell configs
OneDrive/           # Windows-specific OneDrive PowerShell configs
scripts/            # Utility scripts (excluded from chezmoi)
utilities/          # PowerShell utilities
assets/             # Project assets (excluded from chezmoi)
docs/               # Project documentation (excluded from chezmoi)
game_settings/      # Game configuration files (excluded from chezmoi)
misc/               # Miscellaneous files (excluded from chezmoi)
node_modules/       # Node.js dependencies (excluded from chezmoi)
.github/            # GitHub workflows (excluded from chezmoi)
```

## 🚀 Development Workflow

### Feature Development
1. Create patch branch: `make patch-branch`
2. Make changes to template files
3. Test with `chezmoi diff`
4. Apply changes with `chezmoi apply`
5. Run quality checks: `make lint`
6. Commit with conventional commits format

### Branch Management
```bash
# Create new patch branch
make patch-branch

# Switch to master
make switch-master

# Clean up branches
make delete-branch

# Morning routine (fetch, pull, cleanup)
make morning-routine
```

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

Types: feat, fix, docs, style, refactor, test, chore

## 🛠️ Special Requirements

### Multi-OS Support
- Always test templates on target OS
- Use appropriate path separators
- Handle executable detection correctly
- Test secret management integration

### Performance Considerations
- Keep shell startup time minimal
- Use lazy loading for heavy configurations
- Optimize Neovim plugin loading
- Cache expensive operations

### Security Requirements
- Never commit secrets to repository
- Use chezmoi's secret management
- Validate executable paths for work PC detection
- Review security-sensitive configurations

## 📊 Monitoring & Maintenance

### Dependency Updates
- Renovate automatically creates PRs for updates
- Review and test updates before merging
- Monitor for breaking changes in tools

### Health Checks
```bash
# Check mise tools installation
mise doctor

# Verify aqua packages
aqua which <tool>

# Test chezmoi templates
chezmoi execute-template < template-file
```

## 🚫 Common Pitfalls to Avoid

1. **Never hardcode paths** - Use chezmoi variables
2. **Never commit secrets** - Use template variables
3. **Always test templates** - Use `chezmoi diff` before apply
4. **Don't break shell startup** - Profile performance
5. **Validate OS detection** - Test on target platforms

## 💡 Pro Tips

1. **Use `chezmoi cd` to navigate to source directory**
2. **Test templates with `chezmoi execute-template`**
3. **Use `mise tasks run` for complex operations**
4. **Leverage aqua for consistent tool versions**
5. **Use lefthook for consistent quality checks**

---

Remember: This is a living configuration that should evolve with development needs while maintaining cross-platform compatibility and performance.
