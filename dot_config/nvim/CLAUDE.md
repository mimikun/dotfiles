# 🚀 CLAUDE.md - mimikun's Neovim Configuration

This file provides specific guidance to Claude Code when working with this Neovim configuration.

## 📖 Design Philosophy

For comprehensive design philosophy and architectural principles, see [@docs/design/nvim.md](../../docs/design/nvim.md).

This document focuses on practical implementation details and AI-specific guidance.

## 📋 Configuration Overview

This is a comprehensive Neovim configuration built with modern Lua practices, featuring:

- **Plugin Manager**: lazy.nvim for efficient plugin management
- **LSP**: Full Language Server Protocol support with mason.nvim
- **Completion**: Advanced completion with blink.cmp and nvim-cmp
- **UI**: Rich UI with multiple colorschemes and status line
- **Development**: Integrated debugging, testing, and formatting tools

## 🏗️ Architecture

### Core Structure
```
dot_config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/             # Core configuration
│   │   ├── init.lua        # Main config loader
│   │   ├── options.lua     # Neovim options
│   │   ├── keymaps.lua     # Key mappings
│   │   ├── global.lua      # Global variables
│   │   └── ...
│   ├── plugins/            # Plugin specifications
│   │   ├── *.lua           # Individual plugin configs
│   │   └── */              # Complex plugin directories
│   ├── colorschemes/       # Color scheme configurations
│   └── utils/              # Utility functions
├── snippets/               # Custom snippets
├── templates/              # File templates
└── utils/                  # Shell utilities
```

### Plugin Organization Pattern
```lua
-- Simple plugin (single file)
return {
  "author/plugin-name",
  opts = {},
  config = function(_, opts)
    -- Setup
  end,
}

-- Complex plugin (directory structure)
plugins/complex-plugin/
├── init.lua        # Main plugin spec
├── opts.lua        # Plugin options
├── keys.lua        # Key mappings
├── cmds.lua        # User commands
└── dependencies.lua # Plugin dependencies
```

## 🔧 Development Standards

### Lua Coding Style
- **Target**: Lua 5.1 (Neovim compatibility)
- **Formatting**: Use stylua with default settings
- **Linting**: Use selene for static analysis
- **Documentation**: Use LuaDoc format for complex functions

### Plugin Configuration Standards
```lua
-- Standard plugin structure
return {
  "author/plugin-name",
  event = "VeryLazy",           -- Load strategy
  dependencies = {},            -- Dependencies
  opts = {},                    -- Plugin options
  config = function(_, opts)    -- Setup function
    require("plugin-name").setup(opts)
  end,
  keys = {},                    -- Key mappings
  cmd = {},                     -- User commands
  ft = {},                      -- File types
}
```

### Key Mapping Conventions
- **Leader key**: `<Space>` (spacebar)
- **Local leader**: `<LocalLeader>` for buffer-specific actions
- **Prefix conventions**:
  - `<leader>f` - File operations
  - `<leader>g` - Git operations  
  - `<leader>s` - Search operations
  - `<leader>t` - Terminal/Test operations
  - `<leader>d` - Debug operations
  - `<leader>l` - LSP operations

### File Organization Rules
1. **Single responsibility**: Each file should have a clear purpose
2. **Consistent naming**: Use kebab-case for file names
3. **Modular structure**: Split complex configs into directories
4. **Performance**: Use lazy loading strategies

## 💡 Plugin Management

### Standard Loading Pattern
```lua
-- Most plugins use this pattern
event = "VeryLazy"  -- mimikun's standard

-- Exceptions
lazy = false        -- For essential plugins
ft = { "lua" }      -- Language-specific
cmd = { "Cmd" }     -- Command-triggered
```

**Note**: See [@docs/design/nvim.md](../../docs/design/nvim.md) for complete plugin management philosophy.

## 🎨 Colorscheme Management

### Colorscheme Selection
- **Primary**: tokyonight-nvim (default)
- **Alternatives**: Multiple themes in `colorschemes/` directory
- **Switching**: Use `huez.nvim` for interactive theme switching

### Theme Configuration Pattern
```lua
-- colorschemes/theme-name.lua
return {
  "author/theme-name",
  name = "theme-name",
  opts = {
    -- Theme-specific options
  },
  config = function(_, opts)
    require("theme-name").setup(opts)
  end,
}
```

## 🔍 LSP & Completion Setup

### LSP Configuration
- **Server management**: mason.nvim for automatic installation
- **Configuration**: Individual configs in `lsp-confs/`
- **Capabilities**: Enhanced with completion and formatting

### Completion Strategy
- **Primary**: blink.cmp (modern, fast completion)
- **Fallback**: nvim-cmp (traditional, stable)
- **Sources**: LSP, snippets, buffer, path, etc.

## 🧪 Testing & Quality

### Code Quality Tools
```bash
# Formatting
stylua --config-path=.stylua.toml .

# Linting
selene lua/

# Plugin health check
:checkhealth lazy
```

### Performance Monitoring
```lua
-- Startup time analysis
:Lazy profile

-- Plugin load times
:Lazy show

-- Health checks
:checkhealth
```

## 🚀 Development Workflow

### Adding New Plugins
1. Create plugin spec in `plugins/` directory
2. Configure options, keys, and commands
3. Test functionality and performance
4. Update documentation if needed
5. Run quality checks

### Modifying Existing Plugins
1. Check current configuration structure
2. Preserve existing functionality
3. Test changes thoroughly
4. Update related configurations

### Configuration Updates
1. **Backup**: Always test in a separate environment
2. **Incremental**: Make small, focused changes
3. **Documentation**: Update comments and docs
4. **Validation**: Run health checks

## 🤖 Agentic Coding (Vibe Coding)

### Core Philosophy
**Agentic Coding** is a development approach where AI agents understand developer intent ("vibe") and autonomously generate optimal configurations. Instead of manual plugin setup, developers express their needs and AI creates contextually appropriate solutions.

### How It Works
```
Developer: "I want super-awesome-plugin.nvim configured"
AI: Analyzes your patterns → Generates optimized config → Applies mimikun's preferences
```

### mimikun's Configuration Patterns
The AI system recognizes these patterns in your setup:

#### **Loading Strategy**
- Default: `event = "VeryLazy"` for optimal performance
- Essential plugins: `lazy = false`
- Language-specific: `ft = { "lua", "rust", "python" }`

#### **Key Mapping Style**
- Leader key: `<Space>`
- Naming pattern: `<leader>sa` for Super Awesome actions
- Descriptive names: `desc = "Super Awesome: Toggle"`
- Quick access: `<leader>S` for frequently used features

#### **UI Preferences**
- Border style: `"rounded"` (consistent with lazy.nvim)
- Icons: Always enabled with extensive usage
- Transparency: Adaptive to colorscheme
- Japanese locale support: `locale = "ja"`

#### **Integration Patterns**
- LSP integration: Always enabled
- Telescope integration: High priority
- Lualine integration: Status line updates
- Neovide support: GUI-specific optimizations

#### **Performance Optimization**
- Caching: `cache_enabled = true`
- Debouncing: `debounce_ms = 100`
- Lazy loading: Event-driven activation
- Dependency management: Automatic plenary.nvim inclusion

### Agentic Configuration Template
```lua
-- Auto-generated based on mimikun's patterns and lazy_plugspec.tpl
---@type LazySpec
local spec = {
  "author/plugin-name",
  -- Repository settings (uncomment as needed)
  --dir = "",
  --url = "",
  --name = "",
  --dev = false,
  --build = "",
  --branch = "",
  --tag = "",
  --commit = "",
  --version = "",
  
  -- Loading strategy (mimikun's standard)
  --lazy = false,
  enabled = false,
  event = "VeryLazy", -- mimikun's preferred loading
  
  -- File type and command loading
  --ft = { "lua", "rust", "python" },
  --cmd = { "PluginCommand" },
  
  -- Key mappings (following mimikun's patterns)
  keys = {
    { "<leader>xy", "<cmd>PluginAction<cr>", desc = "Plugin: Action" },
    { "<leader>X", "<cmd>PluginQuick<cr>", desc = "Plugin: Quick Access" },
  },
  
  -- Dependencies (common mimikun patterns)
  dependencies = { 
    "nvim-tree/nvim-web-devicons", -- Icon support
    "nvim-lua/plenary.nvim", -- Common utility
  },
  
  -- Plugin options
  opts = {
    -- UI preferences
    ui = {
      border = "rounded",
      icons = { enabled = true },
    },
    -- Performance optimization
    performance = {
      cache_enabled = true,
      debounce_ms = 100,
    },
    -- Language support
    locale = "ja",
    -- Integration with existing plugins
    integrations = {
      lsp = true,
      telescope = true,
      lualine = true,
    },
  },
  
  -- Configuration function
  config = function(_, opts)
    require("plugin-name").setup(opts)
    
    -- Neovide-specific settings
    if vim.g.neovide then
      -- GUI optimizations
    end
  end,
  
  -- Advanced settings (uncomment as needed)
  --cond = function() return vim.fn.executable("tool") == 1 end,
  --main = "",
  --pin = false,
  --submodules = false,
  --module = false,
  --priority = 1000,
  --optional = false,
}

return spec
```

### Benefits of Agentic Coding
1. **Instant Setup**: Zero configuration time for new plugins
2. **Consistency**: All plugins follow the same patterns
3. **Optimization**: Performance and integration handled automatically
4. **Maintainability**: Standardized structure across all plugins
5. **Personalization**: Reflects individual developer preferences

### Usage Examples
```lua
-- Request: "Add fuzzy finder plugin"
-- AI generates: telescope.nvim with mimikun's key mappings

-- Request: "I need better git integration"
-- AI generates: neogit + gitsigns with optimized settings

-- Request: "Configure LSP for Rust"
-- AI generates: rustaceanvim with full mason integration
```

### AI Configuration Intelligence
The system learns from:
- **Existing plugin patterns**: Consistent structure and naming
- **Key mapping conventions**: Leader key usage and descriptions
- **Performance preferences**: Lazy loading and optimization
- **UI consistency**: Border styles, icons, and theming
- **Integration requirements**: LSP, telescope, and status line
- **Environment specifics**: Neovide, Japanese locale, development tools

### Future Enhancements
- **Context awareness**: Project-specific plugin suggestions
- **Usage analytics**: Optimize based on actual usage patterns
- **Workflow integration**: Automatic plugin updates based on development needs
- **Team synchronization**: Share optimized configurations across team members

## 📊 Performance Monitoring

### Quick Performance Checks
```lua
-- Startup time analysis
:Lazy profile

-- Plugin load times
:Lazy show

-- Memory usage
:lua print(collectgarbage('count'))
```

**Note**: See [@docs/design/nvim.md](../../docs/design/nvim.md) for complete performance optimization strategy.

## 🔧 Troubleshooting Guide

### Common Issues
1. **Plugin not loading**: Check lazy loading conditions
2. **Key mappings conflict**: Use `:map <key>` to debug
3. **LSP not working**: Check `:LspInfo` and mason installation
4. **Slow startup**: Profile with `:Lazy profile`

### Debug Commands
```vim
:checkhealth          " Overall health check
:Lazy show            " Plugin status
:LspInfo              " LSP server status
:Mason                " Installed tools
:messages             " Error messages
```

## 🎯 Future Improvements

### Planned Enhancements
- [ ] Better plugin organization
- [ ] Performance optimizations
- [ ] Custom user commands
- [ ] Advanced key mappings
- [ ] Better documentation

### Experimental Features
- New completion engines
- Advanced LSP features
- UI enhancements
- Workflow automation

## 📝 Implementation Notes

### Quick Reference
- **Templates**: Use `templates/lazy_plugspec.tpl` for new plugins
- **Testing**: Always test in isolated environment first
- **Health Checks**: Run `:checkhealth` after major changes
- **Profiling**: Use `:Lazy profile` to monitor startup time

### Best Practices
- Copy template → customize → test → integrate
- Use `enabled = false` to temporarily disable plugins
- Follow existing key mapping conventions
- Maintain consistent file organization

---

This configuration provides practical guidance for AI-assisted development. For architectural decisions and design rationale, see [@docs/design/nvim.md](../../docs/design/nvim.md).