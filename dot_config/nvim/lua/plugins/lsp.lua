-- TODO: setting

local cmds = {
    "Mason",
    "MasonUpdate",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
}

local need_lsp_servers = {
    -- Bash
    "bashls",
    -- ArchLinux PKGBUILD?
    "pkgbuild_language_server",
    -- C, C++
    "clangd",
    -- C#
    "csharp_ls",
    -- CMake
    "cmake",
    "neocmake",
    -- css
    "cssls",
    -- deno
    "denols",
    -- Docker
    "dockerls",
    -- docker compose
    "docker_compose_language_service",
    -- EFM (general purpose server)
    "efm",
    -- eslint
    "eslint",
    -- Go
    "golangci_lint_ls",
    "gopls",
    -- HTML
    "html",
    -- JSON
    "jsonls",
    -- JavaScript
    "quick_lint_js",
    "tssserver",
    "vtsls",
    -- JavaScript and JSON
    "biome",
    -- Lua, Luau
    "lua_ls",
    "luau_lsp",
    -- Markdown
    "marksman",
    "prosemd_lsp",
    "remark_ls",
    "vale_ls",
    "zk",
    -- PowerShell
    "powershell_es",
    -- Python
    "pyright",
    -- Ruby
    "solargraph",
    -- Rust
    "rust_analyzer",
    -- TOML
    "taplo",
    -- VimL
    "vimls",
    -- YAML
    "yamlls",
    -- Zig
    "zls",
}

return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        --event = "BufRead",
        cmd = cmds,
        --build = ":Command",
        config = function()
            require("mason").setup({})
        end,
        cond = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        --event = "BufRead",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        --cmd = cmds,
        --build = ":Command",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                },
            })
        end,
        cond = false,
    },
}
