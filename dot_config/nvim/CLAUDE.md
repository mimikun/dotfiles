# 🚀 CLAUDE.md - mimikun's Neovim Configuration

This file provides specific guidance to Claude Code when working with this Neovim configuration.

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

## 💡 Plugin Management Philosophy

### Plugin Selection Criteria
- **Stability**: Prefer mature, well-maintained plugins
- **Performance**: Minimize startup time impact
- **Functionality**: Avoid feature overlap
- **Community**: Active development and user base

### Loading Strategy
```lua
-- Immediate loading (essential plugins)
lazy = false

-- Event-based loading (most plugins)
event = "VeryLazy"

-- File type specific
ft = { "lua", "python", "rust" }

-- Command-based loading
cmd = { "PluginCommand" }

-- Key-based loading
keys = {
  { "<leader>p", "<cmd>PluginCommand<cr>", desc = "Plugin action" }
}
```

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
-- Auto-generated based on mimikun's patterns
return {
  "author/plugin-name",
  event = "VeryLazy", -- mimikun's standard
  dependencies = {
    "nvim-lua/plenary.nvim", -- Common pattern
    "nvim-tree/nvim-web-devicons", -- Icon support
  },
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
  config = function(_, opts)
    require("plugin-name").setup(opts)
    
    -- Neovide-specific settings
    if vim.g.neovide then
      -- GUI optimizations
    end
  end,
  keys = {
    -- Following mimikun's key mapping patterns
    { "<leader>xy", "<cmd>PluginAction<cr>", desc = "Plugin: Action" },
    { "<leader>X", "<cmd>PluginQuick<cr>", desc = "Plugin: Quick Access" },
  },
  cmd = { "PluginCommand" }, -- Lazy loading
}
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

## 📊 Performance Optimization

### Startup Time Goals
- **Target**: < 50ms cold start
- **Monitoring**: Use `lazy.nvim` profiler
- **Optimization**: Lazy loading, minimal init.lua

### Memory Usage
- **Monitoring**: `:lua print(collectgarbage('count'))`
- **Optimization**: Unload unused plugins, clean configurations

### Common Performance Patterns
```lua
-- Lazy loading with events
event = { "BufReadPre", "BufNewFile" }

-- Conditional loading
cond = function()
  return vim.fn.executable("tool") == 1
end

-- Deferred loading
priority = 1000  -- High priority for essential plugins
```

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

## 📝 Notes

### Configuration Philosophy
- **Minimalism**: Keep configuration clean and focused
- **Modularity**: Easy to modify and extend
- **Performance**: Fast startup and responsive editing
- **Reliability**: Stable and predictable behavior

### Best Practices
- Test changes in isolated environment
- Document complex configurations
- Follow Neovim best practices
- Keep plugins updated but stable

---

This configuration is designed to be a powerful, efficient, and maintainable Neovim setup that grows with development needs while maintaining excellent performance.