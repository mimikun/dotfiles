local settings = {}

-- Set it to false if you don't use copilot
---@type boolean
settings["use_copilot"] = false

-- Required coc extensions
---@type table
settings["coc_extensions"] = {
    "coc-css",
    "coc-deepl",
    "coc-deno",
    "coc-eslint",
    "coc-explorer",
    "coc-git",
    "coc-highlight",
    "coc-html",
    "coc-html-css-support",
    "coc-jest",
    "coc-json",
    "coc-lists",
    "coc-lua",
    "coc-marketplace",
    "coc-pairs",
    "@raidou/coc-prettier-v3",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-toml",
    "coc-tsserver",
    "coc-yaml",
    "@yaegassy/coc-black-formatter",
    "@yaegassy/coc-mypy",
    "@yaegassy/coc-nginx",
    "coc-zig",
}

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
    -- deno
    "denols",
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
    -- TOML
    "taplo",
    -- VimL
    "vimls",
    -- YAML
    "yamlls",
    -- Zig
    "zls",
}

return settings
