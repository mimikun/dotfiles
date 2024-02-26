local settings = {}

-- Set it to false if you don't use copilot
---@type boolean
settings["use_copilot"] = false

-- Set to `true` to FORCE denops to be enabled no human rights
-- DO NOT use `chezmoi add` when set to `true`
-- default: `false`
---@type boolean
settings["use_denops"] = false

-- Required lsp servers
---@type table
settings["lsp_servers"] = {
    -- typos
    "typos_lsp",
    -- bash
    "bashls",
    -- C, C++
    "clangd",
    -- C Sharp
    "csharp_ls",
    -- CMake
    "neocmake",
    -- CSS
    "cssls",
    -- Docker
    "dockerls",
    -- docker-compose
    "docker_compose_language_service",
    -- EFM (general purpose server)
    "efm",
    -- eslint
    "eslint",
    -- golang
    "gopls",
    -- GraphQL
    "graphql",
    -- HTML
    "html",
    -- JSON
    "jsonls",
    -- JavaScript, TypeScript
    "tsserver",
    -- jq
    "jqls",
    -- Lua
    "lua_ls",
    -- Luau
    "luau_lsp",
    -- Make
    --"autotools-language-server",
    -- Markdown
    "marksman",
    -- Powershell
    "powershell_es",
    -- Python
    "pyright",
    -- Ruby
    "solargraph",
    -- Rust
    "rust_analyzer",
    -- SQL
    -- Sphinx
    "esbonio",
    -- VimL
    "vimls",
    -- YAML
    "yamlls",
    -- Zig
    "zls",
}

-- Required coc extensions
---@type table
settings["treesitter_parsers"] = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "html",
    "ini",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "json5",
    "kdl",
    "latex",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "ocaml",
    "ocaml_interface",
    "org",
    "python",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scss",
    "sql",
    "svelte",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
}

return settings
