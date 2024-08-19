local global = require("config.global")

local M = {}

M.powershell = {
    install_info = {
        url = "https://github.com/mimikun/tree-sitter-PowerShell",
        files = { "src/parser.c" },
        branch = "test",
    },
    filetype = { "ps1", "psd1" },
}

M.just = {
    install_info = {
        url = "https://github.com/IndianBoy42/tree-sitter-just",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
        -- this may be necessary on MacOS (try if you see compiler errors)
        --use_makefile = true
    },
    filetype = { "just", "Justfile" },
    maintainers = { "@IndianBoy42" },
}

M.vhs = {
    install_info = {
        url = "https://github.com/charmbracelet/tree-sitter-vhs",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = { "tape" },
}

---@type table
local minimum_required_parsers = {
    "bash",
    "css",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "ini",
    "javascript",
    "jq",
    "json",
    "jsonc",
    "json5",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

---@type table
local base_parsers = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "djot",
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
    "jsonc",
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

if global.is_linux or global.is_wsl then
    table.insert(base_parsers, "ocaml")
    table.insert(base_parsers, "ocaml_interface")
end

M.need_parsers = minimum_required_parsers

return M
