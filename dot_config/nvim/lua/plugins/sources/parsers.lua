local global = require("core.global")
local is_linux = global.is_linux
local is_wsl = global.is_wsl

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

M.need_parsers = base_parsers

if is_linux or is_wsl then
    table.insert(base_parsers, "ocaml")
    table.insert(base_parsers, "ocaml_interface")
    M.need_parsers = base_parsers
end

return M
